function barSizeIfCorrect(val1,val2)
{
    var x = (val2==0) ? 0 : Math.floor((val1/val2)*100);
    return x
}

function barSizeIfWrong(val1,val2)
{
    var x = (val2==0) ? 0 : Math.floor((val1/val2)*100);
    return x
}
