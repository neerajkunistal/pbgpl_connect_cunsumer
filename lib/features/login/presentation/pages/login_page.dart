import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/login/domain/bloc/login_event.dart';
import 'package:customer_connect/features/login/domain/bloc/login_state.dart';
import 'package:customer_connect/utills/login_customt_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {



  @override
  void initState() {
   BlocProvider.of<LoginBloc>(context).add(LoginPageLoadingEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: BlocBuilder<LoginBloc,LoginState>(
        builder: (context, state){
          if(state is LoginSubmitState){
            return Center(
              child: _buildLayout(data: state),
            );
          } else{
            return CircularProgressIndicator();
          }
        },
      )
    );
  }

  Widget _buildLayout({required LoginSubmitState data}){
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 7.0,
                  shadowColor: Colors.teal,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _horizontalSpace(),
                                logoWidget()
                              ],
                            ),
                          ),
                        ),
                        _horizontalSpace(),
                        _bpNumberTextField(data: data),
                        _horizontalSpace(),
                        _passwordTextField(data: data),
                        _horizontalSpace(),
                        _loginButton(data: data),
                        _companyLogoWidget(),
                        _companyNameWidget(),
                        _horizontalSpace(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
Widget _horizontalSpace(){
    return  SizedBox(height: 13);
}
  Widget logoWidget(){
    return Container(
      child: new CircleAvatar(
        radius: 60,
        backgroundColor: Colors.lightBlueAccent,
        child: Container(
            width: 80,
            height: 80,
            child: Image(image: AssetImage('assets/images/logo.png',))),
      ),
    );
  }
  Widget _bpNumberTextField({required LoginSubmitState data}){
    return  UserTextField(
      obscureText : false,
      keyboardType: TextInputType.text,
      controller: data.bpNumberTextFiledController,
      labelText: "BP Number",
      onChanged: (value) => BlocProvider.of<LoginBloc>(context).add(LoginSetBpNumberEvent(bpNumber: value)),
    );
  }

  Widget _passwordTextField({required LoginSubmitState data}){
    return  UserTextField(
      obscureText : data.isPassword,
      keyboardType : TextInputType.text,
      labelText: "Password",
      onChanged: (value) => BlocProvider.of<LoginBloc>(context).add(LoginSetPasswordEvent(password: value)),

    );
  }

  Widget _loginButton({required LoginSubmitState data}){
    return
      data.isLoader ==false ?
      ElevatedButton(
      style: ButtonStyle(
          padding:  MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)
              )
          )
      ),
      child: Text("Login"),
      onPressed:(){
        BlocProvider.of<LoginBloc>(context).add(LoginSubmitDataEvent(context: context, isLoginPage :true));
      },
    )
       : CircularProgressIndicator();
  }

  Widget _companyNameWidget(){
    return  Align(
      alignment:Alignment.bottomCenter,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Container(
                    width: 30, height: 30,
                    child: Image.asset('assets/images/unistal.png')),
              ),
              Text("Powered By Unistal Systems Pvt.Ltd.")
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyLogoWidget(){
    return  Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
            width: 200, height: 30,
            child: Image.asset('assets/images/smartgasnet.png')),
      ),
    );
  }

}
