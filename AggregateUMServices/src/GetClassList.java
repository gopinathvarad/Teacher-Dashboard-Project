
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;

/**
 * Servlet implementation class GetClassList
 */
@WebServlet("/GetClassList")
public class GetClassList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String secureKey = "AHD91JSKC72";

    public GetClassList() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        boolean error = false;

        String errorMsg = "";
        um2DBInterface um2_db;
        ConfigManager cm = new ConfigManager(this); // this object gets the
                                                    // database connections
                                                    // values

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String grp = request.getParameter("grp"); // group id
        String key = request.getParameter("key"); // key for including
                                                        // email and names
        
        String hexKey = "";
        
        try {
        	String message = secureKey + "_" + grp;
        	MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedhash = digest.digest(message.getBytes(StandardCharsets.UTF_8));
            hexKey = bytesToHex(encodedhash);
		} catch (Exception e) {
			e.printStackTrace();
		}

        String output = "";
        if (grp == null || grp.length() < 3) {
            error = true;
            errorMsg = "group identifier not provided or invalid";
        } else {

            um2_db = new um2DBInterface(cm.um2_dbstring, cm.um2_dbuser,
                    cm.um2_dbpass);
            um2_db.openConnection();

            ArrayList<String[]> classList = um2_db.getClassList(grp);

            if (classList == null) {
                error = true;
                errorMsg = "group has no members or does not exist";
            } else {

                output = "{ group:\"" + grp + "\", learners:[  \n";
                if (secureKey == null || !key.equals(hexKey)) {
                    for (String[] student : classList) {
                        output += "  {learnerId: \""
                                + student[0]
                                + "\", name:\"undefined\", email:\"undefined\"},\n";
                    }
                } else {
                    for (String[] student : classList) {
                        output += "  {learnerId: \"" + student[0]
                                + "\", name:\"" + student[1] + "\", email:\""
                                + student[2] + "\"},\n";
                    }
                }

                output = output.substring(0, output.length() - 2);
                output += "\n]}";
            }

            um2_db.closeConnection();
        }
        if (error) {
            out.print("{ error: 1, errorMsg:\"" + errorMsg + "\"}");
        } else {
            out.print(output);
        }

    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    private String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if(hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

}
