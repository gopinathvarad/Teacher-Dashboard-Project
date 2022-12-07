# Learning Analytics Dashboards

Use the following command to install all dependencies for the project:

### `npm i`

### Project structure

    .
    ├── public
    ├── src                                     # The actual source files of the project
    │   ├── components                          # This is where every component developed for this project is storaged
    │   ├── context                             # Folder containing files for React Context use. 
    │   │   ├── types.js                        # Variables used for the context and reducer files. These are the actions we want to execute.
    │   │   ├── colors                          # Folder containing the color palette context.  
    │   │   │   ├── colorsContext.js            # File that creates and exports the colors context.
    │   │   │   ├── colorsReducer.js            # File containing the behaviour of every action in the context.
    │   │   │   └── colorsState.js              # File containing the state of the context
    │   │   └── students                        # Folder containing the students info context. 
    │   │       ├── studentsContext.js          # File that creates and exports the colors context.
    │   │       ├── studentsReducer.js          # File containing the behaviour of every action in the context.
    │   │       └── studentsState.js            # Folder containing the students info context. 
    │   ├── public                              # Contains assets for the project
    │   ├── styles                              # This is where css files go
    │   ├── utils                               # Utilities functions and files
    │   ├── App.js                              # This is the project's main component, which acts as a container for all other components.
    │   └── index.js                            # File that renders the main component (App.js).
    └── package.json                            # Project's metadata containing scripts and dependencies.

This project was created with [React](reactjs.org).
  
## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.
