import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/core/injector.dart';
import 'package:nucs_mobile/features/academic/data/models/academic_enrollment_request.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/view/view_models/academic_enrollment_view_model.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';
import '../../../../utils/view_model_state.dart';


final academicEnrollmentVM = AutoDisposeNotifierProvider<AcademicEnrollmentViewModel,ViewModelState<bool>>((){
  return AcademicEnrollmentViewModel(academicRepository: injector.get());
});


class DegreeProgramEnrollmentPage extends ConsumerStatefulWidget {
  final DegreeProgram degreeProgram;
  const DegreeProgramEnrollmentPage({super.key,required this.degreeProgram});

  @override
  ConsumerState createState() => _DegreeProgramEnrollmentPageState();
}

class _DegreeProgramEnrollmentPageState extends ConsumerState<DegreeProgramEnrollmentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPhone = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    ViewModelState<bool> enrollmentState = ref.watch(academicEnrollmentVM);

    ref.listen(academicEnrollmentVM, _onListenAcademicEnrollmentVM);
    return Scaffold(
      appBar: AppBar(title: Text("Enrollment")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingPage,vertical: AppDimension.paddingPage),
          children: [
            Text(widget.degreeProgram.title,style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
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
            Text("Phone",style: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppDimension.paddingS),
            TextFormField(
              controller: _txtPhone,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Phone is required";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter your phone",
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
              await ref.read(academicEnrollmentVM.notifier).enrollDegreeProgram(
                  AcademicEnrollmentRequest(
                      name: _txtName.text.trim(),
                      email: _txtEmail.text.trim(),
                      phone: _txtPhone.text.trim()));
            }
          },
          child: Text("Enroll")),
    );
  }

  void _onListenAcademicEnrollmentVM(previousState,currentState){
    switch(currentState){
      case ViewModelLoadingState() : SmartDialog.showLoading();
      case ViewModelSuccessState<bool>() :{
        SmartDialog.dismiss();
        context.pop();
        SmartDialog.showToast("Enrollment successful, we'll contacet you soon");
      }
      case ViewModelFailState() :{
        SmartDialog.dismiss();
        SmartDialog.showToast("Enrollment failed");
      }
      default:{}
    }
  }
}

