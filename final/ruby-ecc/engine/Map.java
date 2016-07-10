// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Map.java

import java.awt.Point;
import java.io.*;

class Map
{

    public Map()
    {
    }

    public Map(String s)
    {
        ReadFromFile(s);
    }

    public int Width()
    {
        return width;
    }

    public int Height()
    {
        return height;
    }

    public boolean IsWall(int i, int j)
    {
        if(i < 0 || j < 0 || i >= width || j >= height)
            return true;
        else
            return walls[i][j];
    }

    public int PlayerOneX()
    {
        return (int)playerOneLocation.getX();
    }

    public int PlayerOneY()
    {
        return (int)playerOneLocation.getY();
    }

    public int PlayerTwoX()
    {
        return (int)playerTwoLocation.getX();
    }

    public int PlayerTwoY()
    {
        return (int)playerTwoLocation.getY();
    }

    public void WriteToStream(OutputStream outputstream)
        throws Exception
    {
        try
        {
            String s = (new StringBuilder()).append("").append(width).append(" ").append(height).append("\n").toString();
            for(int i = 0; i < s.length(); i++)
                outputstream.write(s.charAt(i));

            for(int j = 0; j < height; j++)
            {
                for(int k = 0; k < width; k++)
                {
                    if(PlayerOneX() == k && PlayerOneY() == j)
                    {
                        outputstream.write(49);
                        continue;
                    }
                    if(PlayerTwoX() == k && PlayerTwoY() == j)
                        outputstream.write(50);
                    else
                        outputstream.write(walls[k][j] ? 35 : 32);
                }

                outputstream.write(10);
            }

            outputstream.flush();
        }
        catch(Exception exception)
        {
            System.err.println((new StringBuilder()).append("FATAL ERROR: failed to write to stream: ").append(exception).toString());
            throw new Exception("One of the programs crashed!");
        }
    }

    public void Print()
    {
        System.out.println((new StringBuilder()).append("").append(width).append(" ").append(height).toString());
        for(int i = 0; i < height; i++)
        {
            for(int j = 0; j < width; j++)
            {
                if(PlayerOneX() == j && PlayerOneY() == i)
                {
                    System.out.write(49);
                    continue;
                }
                if(PlayerTwoX() == j && PlayerTwoY() == i)
                    System.out.write(50);
                else
                    System.out.write(walls[j][i] ? 35 : 32);
            }

            System.out.write(10);
        }

        System.out.flush();
    }

    public void ReadFromFile(String s)
    {
        BufferedReader bufferedreader = null;
        try
        {
            bufferedreader = new BufferedReader(new FileReader(s));
            String s1 = "";
            int i;
            try
            {
                while((i = bufferedreader.read()) >= 0 && i != 10) 
                    s1 = (new StringBuilder()).append(s1).append((char)i).toString();
            }
            catch(Exception exception3)
            {
                System.err.println("Could not read from stdin.");
                System.exit(1);
            }
            String as[] = s1.split(" ");
            if(as.length != 2)
            {
                System.err.println((new StringBuilder()).append("FATAL ERROR: the first line of input should be two integers separated by a space. Instead, got: ").append(s1).toString());
                System.exit(1);
            }
            try
            {
                width = Integer.parseInt(as[0]);
                height = Integer.parseInt(as[1]);
            }
            catch(Exception exception4)
            {
                System.err.println((new StringBuilder()).append("FATAL ERROR: invalid map dimensions: ").append(s1).toString());
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
                if(k >= width || l >= height)
                    break;
                int i1 = 0;
                try
                {
                    i1 = bufferedreader.read();
                }
                catch(Exception exception5)
                {
                    System.err.println("FATAL ERROR: exception while reading from stdin.");
                    System.exit(1);
                }
                if(i1 < 0)
                    break;
                switch(i1)
                {
                case 10: // '\n'
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
                        System.err.println((new StringBuilder()).append("FATAL ERROR: found two locations for player 1 in the map! First location is (").append(playerOneLocation.getX()).append(",").append(playerOneLocation.getY()).append("), second location is (").append(k).append(",").append(l).append(").").toString());
                        System.exit(1);
                    }
                    walls[k][l] = true;
                    playerOneLocation = new Point(k, l);
                    flag = true;
                    break;

                case 50: // '2'
                    if(flag1)
                    {
                        System.err.println((new StringBuilder()).append("FATAL ERROR: found two locations for player 2 in the map! First location is (").append(playerTwoLocation.getX()).append(",").append(playerTwoLocation.getY()).append("), ").append("second location is (").append(k).append(",").append(l).append(").").toString());
                        System.exit(1);
                    }
                    walls[k][l] = true;
                    playerTwoLocation = new Point(k, l);
                    flag1 = true;
                    break;

                default:
                    System.err.println((new StringBuilder()).append("FATAL ERROR: invalid character received. ASCII value = ").append(i1).toString());
                    System.exit(1);
                    break;
                }
                k++;
                j++;
                if(k >= width)
                {
                    l++;
                    k = 0;
                }
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
        catch(Exception exception1)
        {
            if(bufferedreader != null)
                try
                {
                    bufferedreader.close();
                }
                catch(Exception exception2) { }
            break MISSING_BLOCK_LABEL_787;
        }
        if(bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch(Exception exception) { }
        break MISSING_BLOCK_LABEL_787;
        Exception exception6;
        exception6;
        if(bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch(Exception exception7) { }
        throw exception6;
    }

    public int MovePlayerOne(int i)
    {
        int j = PlayerOneX();
        int k = PlayerOneY();
        walls[j][k] = true;
        switch(i)
        {
        case 1: // '\001'
            playerOneLocation = new Point(j, k - 1);
            break;

        case 2: // '\002'
            playerOneLocation = new Point(j + 1, k);
            break;

        case 3: // '\003'
            playerOneLocation = new Point(j, k + 1);
            break;

        case 4: // '\004'
            playerOneLocation = new Point(j - 1, k);
            break;

        default:
            return -1;
        }
        j = PlayerOneX();
        k = PlayerOneY();
        return !IsWall(j, k) ? 0 : -1;
    }

    public int MovePlayerTwo(int i)
    {
        int j = PlayerTwoX();
        int k = PlayerTwoY();
        walls[j][k] = true;
        switch(i)
        {
        case 1: // '\001'
            playerTwoLocation = new Point(j, k - 1);
            break;

        case 2: // '\002'
            playerTwoLocation = new Point(j + 1, k);
            break;

        case 3: // '\003'
            playerTwoLocation = new Point(j, k + 1);
            break;

        case 4: // '\004'
            playerTwoLocation = new Point(j - 1, k);
            break;

        default:
            return -1;
        }
        j = PlayerTwoX();
        k = PlayerTwoY();
        return !IsWall(j, k) ? 0 : -1;
    }

    public Map SwapPlayers()
    {
        Map map = new Map();
        map.walls = walls;
        map.width = width;
        map.height = height;
        map.playerOneLocation = playerTwoLocation;
        map.playerTwoLocation = playerOneLocation;
        return map;
    }

    private int width;
    private int height;
    private boolean walls[][];
    private Point playerOneLocation;
    private Point playerTwoLocation;
}
