// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Tron.java

import java.io.PrintStream;

class Tron
{

    Tron()
    {
    }

    public static void main(String args[])
    {
        if(args.length < 3)
        {
            System.err.println("FATAL ERROR: not enough command-line arguments.\nUSAGE: java -jar Tron.jar map-filename command-to-start-player-one command-to-start-player-two [delay-between-turns] [max-move-time]");
            System.exit(1);
        }
        String s = args[0];
        String s1 = args[1];
        String s2 = args[2];
        int i = 1;
        if(args.length >= 4)
            i = Integer.parseInt(args[3]);
        int j = 3;
        if(args.length >= 5)
            j = Integer.parseInt(args[4]);
        Comm comm = null;
        Comm comm1 = null;
        try
        {
            comm = new Comm(s1);
        }
        catch(Exception exception)
        {
            System.err.println((new StringBuilder()).append("Problem while starting program 1: ").append(exception).toString());
            System.exit(1);
        }
        try
        {
            comm1 = new Comm(s2);
        }
        catch(Exception exception1)
        {
            System.err.println((new StringBuilder()).append("Problem while starting program 2: ").append(exception1).toString());
            System.exit(1);
        }
        Map map = new Map(s);
        map.Print();
        do
        {
            try
            {
                Thread.sleep(i * 1000);
            }
            catch(Exception exception2) { }
            int k = comm.GetMove(map, j);
            int l = comm1.GetMove(map.SwapPlayers(), j);
            k = map.MovePlayerOne(k);
            l = map.MovePlayerTwo(l);
            if(map.PlayerOneX() == map.PlayerTwoX() && map.PlayerOneY() == map.PlayerTwoY())
            {
                System.out.println("Players collided. Draw!");
                break;
            }
            if(k < 0 && l < 0)
            {
                System.out.println("Both players crashed. Draw!");
                break;
            }
            if(k < 0)
            {
                System.out.println("Player Two Wins!");
                break;
            }
            if(l < 0)
            {
                System.out.println("Player One Wins!");
                break;
            }
            map.Print();
        } while(true);
    }
}
