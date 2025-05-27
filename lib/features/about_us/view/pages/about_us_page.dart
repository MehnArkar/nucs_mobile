import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: ListView(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        children: [
          CachedNetworkImage(imageUrl: "https://nucs-edu.org/wp-content/uploads/elementor/thumbs/Screenshot-2024-10-08-101428-r5db0aj54j0d8ewrpmedwf1b21baqvo5pwt3wnc7e8.png",fit: BoxFit.fitWidth),
          SizedBox(height: AppDimension.paddingM),
          Text("NUCS ၏ နောက်ခံသမိုင်း",style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: AppDimension.paddingS),
          Text("""
          National University of Computer Studies (NUCS) သည် အမျိုးသားညီညွတ်‌ရေးအစိုးရ၊ ပညာရေးဝန်ကြီးဌာန၏ တရားဝင်အသိအမှတ်ပြုမှုနှင့်အညီ တည်ထောင်ဖွင့်လှစ်ထားသော ကိုယ်ပိုင်အုပ်ချုပ်ခွင့်ရ တက္ကသိုလ် (Self-Administrative University) တစ်ခုဖြစ်ပါသည်။

မြန်မာနိုင်ငံတဝှမ်းရှိ ကွန်ပျူတာတက္ကသိုလ်များနှင့် သတင်းအချက်အလက်နည်းပညာတက္ကသိုလ်၊ ကွန်ပျူတာနှီးနွယ်တက္ကသိုလ်များဖြစ်သော မြန်မာသတင်းအချက်အလက်နည်းပညာတက္ကသိုလ်နှင့် နည်းပညာတက္ကသိုလ် (ရတနာပုံဆိုက်ဘာစီးတီး)များ၏ IT ဘာသာရပ်များမှ ပညာရေးရပ်တန့်နေခဲ့သော ကျောင်းသား/သူများ အတွက် ဆက်လက်ပညာသင်ယူနိုင်ရေးကို ၂၀၂၄ အောက်တိုဘာလမှ၍ စတင်လက်ခံသင်ကြားပေးလျှက်ရှိပါသည်။

၂၀၂၃-၂၄ ပညာသင်နှစ်မှစ၍ တက္ကသိုလ်ဝင်ခွင့်စိစစ်ရေးအဖွဲ့မှတဆင့် လျှောက်ထားကြသော ပထမနှစ် ကျောင်းသား/သူ များကိုလည်း လက်ခံသင်ကြားပေးလျှက်ရှိပါသည်။
          """,
          style: context.textTheme().bodyMedium)
        ],
      ),
    );
  }
}
