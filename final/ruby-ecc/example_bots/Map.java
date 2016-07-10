// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Map.java

import java.awt.Point;
import java.io.InputStream;
import java.io.PrintStream;

class Map
{

    Map()
    {
    }

    public static int Width()
    {
        return width;
    }

    public static int Height()
    {
        return height;
    }

    public static boolean IsWall(int i, int j)
    {
        if(i < 0 || j < 0 || i >= width || j >= height)
            return true;
        else
            return walls[i][j];
    }

    public static int MyX()
    {
        return (int)myLocation.getX();
    }

    public static int MyY()
    {
        return (int)myLocation.getY();
    }

    public static int OpponentX()
    {
        return (int)opponentLocation.getX();
    }

    public static int OpponentY()
    {
        return (int)opponentLocation.getY();
    }

    public static void MakeMove(String s)
    {
        if(s.length() <= 0)
        {
            System.err.println("FATAL ERROR: empty direction string. You must specify a valid direction in which to move.");
            System.exit(1);
        }
        char c = s.substring(0, 1).toUpperCase().charAt(0);
        switch(c)
        {
        case 78: // 'N'
            MakeMove(1);
            break;

        case 69: // 'E'
            MakeMove(2);
            break;

        case 83: // 'S'
            MakeMove(3);
            break;

        case 87: // 'W'
            MakeMove(4);
            break;

        default:
            System.err.println("FATAL ERROR: invalid move string. The string must begin with one of the characters 'N', 'E', 'S', or 'W' (not case sensitive).");
            System.exit(1);
            break;
        }
    }

    public static void Initialize()
    {
        String s = "";
        int i;
        try
        {
            while((i = System.in.read()) >= 0 && i != 10) 
                s = (new StringBuilder()).append(s).append((char)i).toString();
        }
        catch(Exception exception)
        {
            System.err.println("Could not read from stdin.");
            System.out.flush();
            System.exit(1);
        }
        s = s.trim();
        if(s.equals("") || s.equals("exit"))
            System.exit(1);
        String as[] = s.split(" ");
        if(as.length != 2)
        {
            System.err.println((new StringBuilder()).append("FATAL ERROR: the first line of input should be two integers separated by a space. Instead, got: ").append(s).toString());
            System.err.flush();
            System.exit(1);
        }
        try
        {
            width = Integer.parseInt(as[0]);
            height = Integer.parseInt(as[1]);
        }
        catch(Exception exception1)
        {
            System.err.println((new StringBuilder()).append("FATAL ERROR: invalid map dimensions: ").append(s).toString());
            System.err.flush();
            System.exit(1);
        }
        walls = new boolean[width][height];
        boolean flag = false;
        boolean flag1 = false;
        int j = 0;
        int k = 0;
        int l = 0;
        do
        {
            if(l >= height)
                break;
            int i1 = 0;
            try
            {
                i1 = System.in.read();
            }
            catch(Exception exception2)
            {
                System.err.println("FATAL ERROR: exception while reading from stdin.");
                System.exit(1);
            }
            if(i1 < 0)
                break;
            switch(i1)
            {
            case 10: // '\n'
                if(k != width)
                {
                    System.err.println((new StringBuilder()).append("Invalid line length: ").append(k).append("(line ").append(l).append(")").toString());
                    System.exit(1);
                }
                l++;
                k = 0;
                continue;

            case 13: // '\r'
                continue;

            case 32: // ' '
                walls[k][l] = false;
                break;

            case 35: // '#'
                walls[k][l] = true;
                break;

            case 49: // '1'
                if(flag)
                {
                    System.err.println((new StringBuilder()).append("FATAL ERROR: found two locations for player 1 in the map! First location is (").append(myLocation.getX()).append(",").append(myLocation.getY()).append("), second location is (").append(k).append(",").append(l).append(").").toString());
                    System.exit(1);
                }
                walls[k][l] = true;
                myLocation = new Point(k, l);
                flag = true;
                break;

            case 50: // '2'
                if(flag1)
                {
                    System.err.println((new StringBuilder()).append("FATAL ERROR: found two locations for player 2 in the map! First location is (").append(opponentLocation.getX()).append(",").append(opponentLocation.getY()).append("), second location ").append("is (").append(k).append(",").append(l).append(").").toString());
                    System.exit(1);
                }
                walls[k][l] = true;
                opponentLocation = new Point(k, l);
                flag1 = true;
                break;

            default:
                System.err.println((new StringBuilder()).append("FATAL ERROR: invalid character received. ASCII value = ").append(i1).toString());
                System.exit(1);
                break;
            }
            k++;
            j++;
        } while(true);
        if(j != width * height)
        {
            System.err.println((new StringBuilder()).append("FATAL ERROR: wrong number of spaces in the map. Should be ").append(width * height).append(", but only found ").append(j).append(" spaces before end of stream.").toString());
            System.exit(1);
        }
        if(!flag)
        {
            System.err.println("FATAL ERROR: did not find a location for player 1!");
            System.exit(1);
        }
        if(!flag1)
        {
            System.err.println("FATAL ERROR: did not find a location for player 2!");
            System.exit(1);
        }
    }

    private static void MakeMove(int i)
    {
        System.out.println(i);
        System.out.flush();
    }

    private static int width;
    private static int height;
    private static boolean walls[][];
    private static Point myLocation;
    private static Point opponentLocation;
}
