package com.weex.jasso.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by SolveException on 2017/7/5.
 */

public class FileUtil {
    public static void createFile(String path){
        createFile(path,null);
    }

    public static void createFile(String path,String fileName){
        File file =null;
        if (path==null){
            new Exception("path no null");
        }
        if (fileName==null){
            file = new File(path);
        }else {
            file=new File(path,fileName);
        }
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void writeCoverageReport(String path,String fileName){
        OutputStream out = null;
        String filePath=path+fileName;
        try {
            out = new FileOutputStream(filePath, false);
            Object agent = Class.forName("org.jacoco.agent.rt.RT")
                    .getMethod("getAgent")
                    .invoke(null);

            out.write((byte[]) agent.getClass().getMethod("getExecutionData", boolean.class)
                    .invoke(agent, false));
        } catch (Exception e) {
//            Log.d(TAG, e.toString(), e);
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
