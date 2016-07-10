// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   RandomBot.java

import java.util.*;

class RandomBot
{

    RandomBot()
    {
    }

    public static String MakeMove()
    {
        int i = Map.MyX();
        int j = Map.MyY();
        ArrayList arraylist = new ArrayList();
        if(!Map.IsWall(i, j - 1))
            arraylist.add("North");
        if(!Map.IsWall(i + 1, j))
            arraylist.add("East");
        if(!Map.IsWall(i, j + 1))
            arraylist.add("South");
        if(!Map.IsWall(i - 1, j))
            arraylist.add("West");
        if(arraylist.size() == 0)
        {
            return "North";
        } else
        {
            Random random = new Random();
            int k = random.nextInt(arraylist.size());
            return (String)arraylist.get(k);
        }
    }

    public static void main(String args[])
    {
        do
        {
            Map.Initialize();
            Map.MakeMove(MakeMove());
        } while(true);
    }
}
