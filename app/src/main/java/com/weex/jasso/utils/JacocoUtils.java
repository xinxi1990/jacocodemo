package com.weex.jasso.utils;

import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class JacocoUtils {

    static String TAG = "JacocoUtils";

    //ec文件的路径
    private static String DEFAULT_COVERAGE_FILE_PATH = "/sdcard/jacoco/coverage.ec";

    /**
     * 生成ec文件
     *
     * @param isNew 是否重新创建ec文件
     */
    public static void generateEcFile(boolean isNew) {
//        String DEFAULT_COVERAGE_FILE_PATH = NLog.getContext().getFilesDir().getPath().toString() + "/coverage.ec";
        Log.d(TAG, "生成覆盖率文件: " + DEFAULT_COVERAGE_FILE_PATH);
        OutputStream out = null;
        File mCoverageFilePath = new File(DEFAULT_COVERAGE_FILE_PATH);
        try {
            if (isNew && mCoverageFilePath.exists()) {
                Log.d(TAG, "JacocoUtils_generateEcFile: 清除旧的ec文件");
                mCoverageFilePath.delete();
            }
            if (!mCoverageFilePath.exists()) {
                mCoverageFilePath.createNewFile();
            }
            out = new FileOutputStream(mCoverageFilePath.getPath(), true);

            Object agent = Class.forName("org.jacoco.agent.rt.RT")
                    .getMethod("getAgent")
                    .invoke(null);

            out.write((byte[]) agent.getClass().getMethod("getExecutionData", boolean.class)
                    .invoke(agent, false));
            Log.d(TAG,"写入" + DEFAULT_COVERAGE_FILE_PATH + "完成!" );
        } catch (Exception e) {
            Log.e(TAG, "generateEcFile: " + e.getMessage());
            Log.e(TAG,e.toString());
        } finally {
            if (out == null)
                return;
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();

            }
        }
    }
}
