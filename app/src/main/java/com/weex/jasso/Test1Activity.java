package com.weex.jasso;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class Test1Activity extends BaseActivity {
    private Button mToastBtn;
    private Button mRequireBtn;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }


    public void require(){
        Toast.makeText(this,"网络请求",Toast.LENGTH_LONG).show();
    }

    public void toast(){
        Intent intent=new Intent(this,Test2Activity.class);
        startActivity(intent);
    }

    public void showTips(View view){
        Toast.makeText(this, "我是提示信息", Toast.LENGTH_SHORT).show();
    }


    public void showError(View view){
        Toast.makeText(this,"我正在抛出错误",Toast.LENGTH_SHORT).show();
        startActivity(new Intent(this,Test2Activity.class));
        finish();
    }

    public void showTest(){
        Toast.makeText(this,"测试",Toast.LENGTH_SHORT).show();
    }

}
