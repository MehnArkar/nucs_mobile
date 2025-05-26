import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/core/injector.dart';
import 'package:nucs_mobile/features/contact_us/data/models/contact_request.dart';
import 'package:nucs_mobile/features/contact_us/view/view_model/contact_request_view_model.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';
import '../../../../utils/view_model_state.dart';



final contactVM = AutoDisposeNotifierProvider<ContactRequestViewModel,ViewModelState<bool>>((){
  return ContactRequestViewModel(clubRepository: injector.get());
});


class ContactUsPage extends ConsumerStatefulWidget {
  const ContactUsPage({super.key});

  @override
  ConsumerState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends ConsumerState<ContactUsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtMessage = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ViewModelState<bool> contactUsState = ref.watch(contactVM);

    ref.listen(contactVM, _onListenAcademicEnrollmentVM);
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingPage,vertical: AppDimension.paddingPage),
          children: [
            //Name Field
            SizedBox(height: AppDimension.paddingM),
            Text("Name",style: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppDimension.paddingS),
            TextFormField(
              controller: _txtName,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Name is required";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),

            //Email Field
            SizedBox(height: AppDimension.paddingM),
            Text("Email",style: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppDimension.paddingS),
            TextFormField(
              controller: _txtEmail,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "email is required";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter your email",
              ),
            ),

            //Phone Field
            SizedBox(height: AppDimension.paddingM),
            Text("Message",style: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppDimension.paddingS),
            TextFormField(
              controller: _txtMessage,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Message is required";
                }
                return null;
              },
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Enter your message",

              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context,){
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(AppDimension.paddingPage),
      child: ElevatedButton(
          onPressed:() async{
            if(_formKey.currentState?.validate() == true){
              await ref.read(contactVM.notifier).contact(
                  ContactRequest(
                      name: _txtName.text.trim(),
                      email: _txtEmail.text.trim(),
                      message: _txtMessage.text.trim()));
            }
          },
          child: Text("Submit")),
    );
  }

  void _onListenAcademicEnrollmentVM(previousState,currentState){
    switch(currentState){
      case ViewModelLoadingState() : SmartDialog.showLoading();
      case ViewModelSuccessState<bool>() :{
        SmartDialog.dismiss();
        context.pop();
        SmartDialog.showToast("Successfully submitted");
      }
      case ViewModelFailState() :{
        SmartDialog.dismiss();
        SmartDialog.showToast("Request failed");
      }
      default:{}
    }
  }
}

