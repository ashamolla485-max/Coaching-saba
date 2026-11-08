# Progress Coaching Centre — Android APK starter

এই repository-তে Flutter অ্যাপের প্রাথমিক UI এবং GitHub Actions দিয়ে অনলাইনে APK build করার workflow আছে।

## মোবাইল থেকে APK তৈরি
1. GitHub অ্যাকাউন্টে নতুন public বা private repository তৈরি করুন; নাম দিন `progress-coaching-centre`।
2. এই ZIP-এর ফাইলগুলো repository-র মূল ফোল্ডারে upload করুন। `.github/workflows/build-apk.yml`-সহ hidden `.github` ফোল্ডারটিও আপলোড হয়েছে কি না নিশ্চিত করুন।
3. `Actions` tab খুলুন। `Build Android APK` workflow নির্বাচন করুন।
4. `Run workflow` চাপুন এবং build শেষ হওয়া পর্যন্ত অপেক্ষা করুন।
5. সফল হলে workflow run-এর নিচে `Artifacts` থেকে `progress-coaching-centre-apk` ডাউনলোড করুন। ZIP extract করলে APK পাবেন।

## সতর্কতা
- এটি UI prototype; login, database, online admission, attendance persistence, payments, result publishing এবং secure admin authorization এখনো যুক্ত নেই।
- APK ফোনে ইনস্টল করার আগে Android-এ ডাউনলোড করা APK-র নিরাপত্তা যাচাই করুন। Play Protect সতর্কতা এলে যাচাই ছাড়া এগোবেন না।
- শিক্ষার্থীদের ব্যক্তিগত তথ্য যুক্ত করার আগে অনুমতি, নিরাপত্তা ও গোপনীয়তা ব্যবস্থা তৈরি করুন।
