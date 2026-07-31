arg_oldi = argument0;
arg_oldj = argument1;

arg_newi = argument2;
arg_newj = argument3;

arg_type = argument4;
arg_state = argument5;

arg_queryingcarindex = argument6;  //used for index gates

if (arg_oldi == arg_newi && arg_oldj == arg_newj)
    {
    return true;
    }

if (taxicab(arg_oldi,arg_oldj,arg_newi,arg_newj) > 1)
    {
    return false;
    }
else
    {
    if (arg_type == 0)
        {
        //not even an intersection!
        return true;
        }
    else if (arg_type == 1)
        {
        if (arg_state)
            {
            //north,south
            return (arg_oldi == arg_newi && arg_oldj != arg_newj);   
            }
        else
            {
            //east,west
            return (arg_oldi != arg_newi && arg_oldj == arg_newj); 
            }
        }
    else if (arg_type == 2)
        {
        if (arg_state)
            {
            //north
            return (arg_oldi == arg_newi && arg_oldj < arg_newj);   
            }
        else
            {
            //south
            return (arg_oldi == arg_newi && arg_oldj > arg_newj); 
            }
        }
    else if (arg_type == 3)
        {
        if (arg_state)
            {
            //west
            return (arg_oldi < arg_newi && arg_oldj == arg_newj);   
            }
        else
            {
            //east
            return (arg_oldi > arg_newi && arg_oldj == arg_newj); 
            }
        }
    else if (arg_type >= 4)
        {
        return (kthbittrue(arg_type - 4,arg_queryingcarindex - 1));
        }
    }
