package com.weex.jasso;

import android.annotation.SuppressLint;
import android.util.Log;


/**
 * Created by SolveException on 2017/7/5.
 */

public class InstrumentedActivity extends Test1Activity {
    public static String TAG = "InstrumentedActivity";

    private FinishListener mListener;

    public void setFinishListener(FinishListener listener) {
        mListener = listener;
    }


    @SuppressLint("MissingSuperCall")
    @Override
    public void onDestroy() {
        Log.d(TAG + ".InstrumentedActivity", "onDestroy()");
        super.finish();
        if (mListener != null) {
            mListener.onActivityFinished();
        }
    }

}
