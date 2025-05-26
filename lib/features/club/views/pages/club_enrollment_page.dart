import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/core/injector.dart';
import 'package:nucs_mobile/features/academic/data/models/academic_enrollment_request.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/view/view_models/academic_enrollment_view_model.dart';
import 'package:nucs_mobile/features/club/data/models/club_request.dart';
import 'package:nucs_mobile/features/club/views/view_models/club_enrollment_view_model.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';
import '../../../../utils/view_model_state.dart';
import '../../data/models/club.dart';


final clubEnrollmentVM = AutoDisposeNotifierProvider<ClubEnrollmentViewModel,ViewModelState<bool>>((){
  return ClubEnrollmentViewModel(clubRepository: injector.get());
});


class ClubEnrollmentPage extends ConsumerStatefulWidget {
  final Club club;
  const ClubEnrollmentPage({super.key,required this.club});

  @override
  ConsumerState createState() => _ClubEnrollmentPageState();
}

class _ClubEnrollmentPageState extends ConsumerState<ClubEnrollmentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _rollNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ViewModelState<bool> enrollmentState = ref.watch(clubEnrollmentVM);

    ref.listen(clubEnrollmentVM, _onListenAcademicEnrollmentVM);
    return Scaffold(
      appBar: AppBar(title: Text("Join Club")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingPage,vertical: AppDimension.paddingPage),
          children: [
            Text(widget.club.title,style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
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
            Text("Roll No.",style: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppDimension.paddingS),
            TextFormField(
              controller: _rollNumber,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Roll No. is required";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter your roll no.",
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
              await ref.read(clubEnrollmentVM.notifier).enrollClub(
                  ClubEnrollmentRequest(
                      name: _txtName.text.trim(),
                      email: _txtEmail.text.trim(),
                      rollNumber: _rollNumber.text.trim()));
            }
          },
          child: Text("Join Request")),
    );
  }

  void _onListenAcademicEnrollmentVM(previousState,currentState){
    switch(currentState){
      case ViewModelLoadingState() : SmartDialog.showLoading();
      case ViewModelSuccessState<bool>() :{
        SmartDialog.dismiss();
        context.pop();
        SmartDialog.showToast("Successfully requested, we'll contacet you soon");
      }
      case ViewModelFailState() :{
        SmartDialog.dismiss();
        SmartDialog.showToast("Request failed");
      }
      default:{}
    }
  }
}

