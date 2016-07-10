// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Comm.java

import java.io.*;

class Comm
{

    public Comm(String s)
        throws Exception
    {
        inputStream = null;
        errorStream = null;
        outputStream = null;
        try
        {
            process = Runtime.getRuntime().exec(s);
            inputStream = process.getInputStream();
            errorStream = process.getErrorStream();
            outputStream = process.getOutputStream();
        }
        catch(Exception exception)
        {
            throw new Exception((new StringBuilder()).append("Problem while starting client program: ").append(exception).toString());
        }
    }

    public void Destroy()
    {
        try
        {
            inputStream.close();
            errorStream.close();
            outputStream.close();
            process.destroy();
        }
        catch(Exception exception) { }
    }

    public int GetMove(Map map, int i)
    {
        int j = -1;
        try
        {
            try
            {
                map.WriteToStream(outputStream);
            }
            catch(Exception exception)
            {
                System.err.println(exception);
                throw exception;
            }
            long l = System.currentTimeMillis();
            do
            {
                if(System.currentTimeMillis() - l >= (long)(i * 1000))
                    break;
                for(; errorStream.available() > 0; System.out.print((char)errorStream.read()));
                if(inputStream.available() > 0)
                {
                    int k = inputStream.read();
                    if(k >= 49 && k <= 52)
                    {
                        j = k - 48;
                        break;
                    }
                }
                Thread.sleep(1L);
            } while(true);
        }
        catch(Exception exception1)
        {
            j = -1;
        }
        return j;
    }

    Process process;
    InputStream inputStream;
    InputStream errorStream;
    OutputStream outputStream;
}
