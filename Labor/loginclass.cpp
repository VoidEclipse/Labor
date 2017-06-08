#include "loginclass.h"

LoginClass::LoginClass(QObject *parent) : QObject(parent)
{

}
/*
public class LoginActivity extends AppCompatActivity implements View.OnClickListener {

    EditText etEmail, etPassword;
    Button bLogin;
    TextView registerLink;

    SharedPreferences userIdPref;
    final  String SAVED_ID = "saved_id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        final Button   bLogin       = (Button)   findViewById(R.id.bLogin);
        final TextView registerLink = (TextView) findViewById(R.id.tvRegister);



        registerLink.setOnClickListener(this);
        bLogin.setOnClickListener(this);

    }
    public void onClick(View v) {
         по id определеяем кнопку, вызвавшую этот обработчик */
       /* switch (v.getId()) {
            case R.id.tvRegister:
                Intent registerIntent = new Intent(LoginActivity.this, RegisterActivity.class);
                LoginActivity.this.startActivity(registerIntent);
                LoginActivity.this.finish();
                break;
            case R.id.bLogin:


                final EditText etEmail      = (EditText) findViewById(R.id.etEmail);
                final EditText etPassword   = (EditText) findViewById(R.id.etPassword);

                final String email          = etEmail.getText().toString();
                final String password       = etPassword.getText().toString();



                Log.d("LOG", "ВХОЖДЕНИЕ");
                Response.Listener<String> responseListener = new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d("LOG", response.toString());
                        try {
                            JSONObject jsonResponse = new JSONObject(response);
                            Integer userId = jsonResponse.getJSONObject("response").getInt("userId");
                            Toast.makeText(getApplicationContext(), "Ваш userId: " + userId, Toast.LENGTH_SHORT).show();


                            userIdPref = getPreferences(MODE_PRIVATE);
                            SharedPreferences.Editor ed = userIdPref.edit();
                            ed.putString("id", userId.toString());
                            ed.commit();


                            Toast.makeText(LoginActivity.this, "idPref - " + userIdPref.getString("id", "No ID") , Toast.LENGTH_SHORT).show();

                            Intent loginIntent = new Intent(LoginActivity.this, MainActivity.class);
                            LoginActivity.this.startActivity(loginIntent);
                            LoginActivity.this.finish();
                        } catch (JSONException e) {
                            e.printStackTrace();
                            try {
                                String responseString = new JSONObject(response).getString("response");
                                Toast.makeText(LoginActivity.this, responseString, Toast.LENGTH_SHORT).show();
                            } catch (JSONException e1) {
                                e1.printStackTrace();
                            }
                        }
                    }
                };

                Map<String, String> params;
                params = new HashMap<>();
                params.put("method", "user.login");

                params.put("email",             email);
                params.put("password",          password);

                RegisterRequest registerRequest = new RegisterRequest(params, responseListener);
                RequestQueue queue              = Volley.newRequestQueue(LoginActivity.this);
                queue.add(registerRequest);

                break;
        }
    }

}
*/
