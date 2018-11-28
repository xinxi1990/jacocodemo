package com.weex.jasso;

import android.app.Activity;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;

import com.weex.jasso.utils.FileUtil;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public abstract class BaseActivity extends Activity {
    public static String DEFAULT_COVERAGE_FILE_PATH = Environment.getExternalStorageDirectory()+"/hb/oe/";
    public static String TAG=Test1Activity.class.getName();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //FileUtil.createFile(DEFAULT_COVERAGE_FILE_PATH,"coverage.ec");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        //closeFile();
    }

    public void closeFile(){
        OutputStream out = null;
        try {
            out = new FileOutputStream(DEFAULT_COVERAGE_FILE_PATH+"/coverage.ec", false);
            Object agent = Class.forName("org.jacoco.agent.rt.RT")
                    .getMethod("getAgent")
                    .invoke(null);

            out.write((byte[]) agent.getClass().getMethod("getExecutionData", boolean.class)
                    .invoke(agent, false));
        } catch (Exception e) {
            Log.d(TAG, e.toString(), e);
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
