import pandas as pd
import numpy as np
from sklearn.impute import SimpleImputer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import  mean_squared_error, mean_absolute_error
import pickle

def Train_Save_Model():
    # الذي يمثل قاعدة البيانات التي سيتم اخذ البيانات ومعالجتها منها والتدريب عليها CSVقراءة ملف ال
    df = pd.read_csv("ML_Dataset.csv")

    # |--------------------------- عملية تنظيف البيانات ---------------------------|

    # استبدال البيانات النصية بقيم رقمية لتطبيق الخوارزمية عليها

    #   الميزات التالية تأخذ قيمتين لذلك يمكن مقابلتها ب ( 1 / 0)
    df['State'] = df['State'].str.replace('New', '1')
    df['State'] = df['State'].str.replace('Used', '0')

    df['Genuine Windows'] = df['Genuine Windows'].str.replace('Yes', '1')
    df['Genuine Windows'] = df['Genuine Windows'].str.replace('No', '0')

    df['Backlit keyboard'] = df['Backlit keyboard'].str.replace('Yes', '1')
    df['Backlit keyboard'] = df['Backlit keyboard'].str.replace('No', '0')

    df['Storage Model'] = df['Storage Model'].str.replace('SSD', '1')
    df['Storage Model'] = df['Storage Model'].str.replace('HDD', '0')

    # هنا تم إزالة بادئة اسم كرت الشاشة وبالتالي تبقى القيمة الرقمية التي سيتم التدريب عليها
    df['GPU'] = df['GPU'].str.replace('RTX', '')
    df['GPU'] = df['GPU'].str.replace('GTX', '')
    df['GPU'] = df['GPU'].str.replace('MX', '')
    # كرت الشاشة المدمج كون قيمته لا تحوي رقم تم مقابلتها بالقيمة 100
    df['GPU'] = df['GPU'].str.replace('Built-in', '100')

    # وأخذ القيمة الرقمية لحجم التخزين GB أيضاً بالنسبة للتخزين تمت إزالة لاحقة
    df['Storage'] = df['Storage'].str.replace('GB', '')
    # والتي تساوي 1024 GB بما يقابلها بوحدة ال T هنا قمنا باستبدال
    df['Storage'] = df['Storage'].str.replace('1TB', '1024')

    # وأخذ القيمة الرقمية لحجم الرام GB بالنسبة للرام تمت إزالة لاحقة
    df['Memory Card'] = df['Memory Card'].str.replace('GB', '')
    # لأخذ جيل الرام DDRتم إزالة بادئة
    df['Memory Card Gen'] = df['Memory Card Gen'].str.replace('DDR', '')

    # وأخذ نوع المعالج Core i إزالة البادئة
    df['CPU'] = df['CPU'].str.replace('Core i', '')

    # (1 / 0) فئة المعالج يأخذ قيمتين لذلك يمكن مقابلتها ب
    df['CPU Model'] = df['CPU Model'].str.replace('U', '0')
    df['CPU Model'] = df['CPU Model'].str.replace('H', '1')

    # تم استبدال دقة الشاشة بأرقام كونها قيمة نصية
    df['Screen Resolution'] = df['Screen Resolution'].str.replace('FHD', '1')
    df['Screen Resolution'] = df['Screen Resolution'].str.replace('QHD', '0')
    df['Screen Resolution'] = df['Screen Resolution'].str.replace('HD', '2')


    # (لأنه غير مؤثر  تم اقتصاص العمود الأول (الماركة))انتقاء الأعمدة التي سيتم تدريب النموذج عليها
    columns = df.columns.tolist()
    newColums = columns[1:14]+[columns[14]]
    df = df[newColums]
    # scikit-learn هو كلاس من مكتبة:SimpleImputer
    # مصمم لمعالجة البيانات الناقصة أو المفقودة عن طريق ملء هذه القيم بقيمة محددة
    imp = SimpleImputer(missing_values=np.nan, strategy='mean')
    # يحدد نوع القيم المفقودة التي سيتم استبدالها: missing_values=np.nan
    # (NaN) في هذه الحالة, استبدال القيم المفقودة بقيمة
    # --------------------------------------------------------------------------------------------------------
    # يحدد الاستراتيجية التي سيتم استخدامها لتعويض القيم المفقودة :strategy='mean'
    # تعويض القيم المفقودة بمتوسط القيم الغير مفقودة في العمود


    # هذا الكود يقوم بتكوين معالج البيانات (imp) الذي تم إنشاؤه وحفظه في المتغير (imputer) باستخدام
    # تمثل هذه الخطوة جزءًا من عملية تعليم المعالج على كيفية تعويض القيم
    # حيث سيتم تعويض البيانات المفقودة باستخدام الإستراتيجية التي تم تحديدها سابقًا
    # سيكون جاهزًا للاستخدام في تعويض البيانات المفقودة في مجموعة البيانات عند الحاجة  .
    imp = imp.fit(df)
    # (المعد مسبقاً(imp)باستخدام) هذا السطر يقوم بتنفيذ عملية تعويض القيم المفقودة
    dataset = imp.transform(df)

    # Slicing تحديد عمود الهدف والأعمدة التي سيتم التدريب عليها باستخدام ال
    X = dataset[:, :-1]
    Y = dataset[:, -1]

    # جديد من المعالجة السابقة Data Frame انشاء
    df_filled = pd.DataFrame(dataset)
    # حساب القيم الفارغة
    missing_values = df_filled.isnull().sum()
    print("||--- missing_values ---|| \n", missing_values)


    # بعد تنظيف البيانات وتجهيزها نأتي لمرحلة النموذج
    # |--------------------------- عملية تدريب النموذج ---------------------------|


    # تستخدم لتقسيم مجموعة البيانات إلى مجموعة تدرب يبشكل عشوائي :train_test_split
    # واسناد الاقسام للمتغيرات المناسبة
    # المصفوفتين التي تحتويان على الميزات والمتغير المستهدف :X و Y
    # نسبةالبيانات التي ستُخصص لمجموعة الاختبار :test_size
    # عملية الاختيار العشوائي, تضمن استخدام تقسيم مماثل في كل مرة:random_state
    # يُفضل تحديدها للحفاظ على تكرارية النتائج
    X_train, X_test, y_train, y_test = train_test_split(
        X, Y, test_size=0.1, random_state=98)  # 87

    # إنشاء نموذج الانحدار الخطي وتدريبه
    # هذا السطر يقوم بإنشاء مثيل لنموذج الانحدار الخطي 
    # :تم تمرير عدة مُعامِلات لإعداد النموذج على النحو التالي 
    # تحدد ما إذا كان سيتم حساب التقاطع لهذا النموذج :fit_intercept=True

    # هذا المُعامِل يُحدد ما إذا كان يجب إنشاء نسخة من البيانات أم لا قبل تدريب النموذج:copy_X=True 

    # هذا المُعامِل يحدد عدد الوظائف (المهام) التي سيتم توزيعها على الأنوية المتاحة في الجهاز:n_jobs=10 
    # في هذه الحالة، سيتم تخصيص 10 وظائف للتدريب. 
    # هذا يمكن أن يكون مفيدًا لتسريع عملية التدريب إذا كان لديك معالج متعدد النوى
    lm = LinearRegression(fit_intercept=True, copy_X=True, n_jobs=10)
    # يستخدم لبدء عملية تدريب النموذج :fit
    # أثناء هذه العملية يتم تدريب النموذج من البيانات التي تم تمريرها
    lm.fit(X_train, y_train)
    # يُستخدم لتنفيذ التنبؤ باستخدام النموذج المدرّب: predict
    y_pred = lm.predict(X_test)

    # ||--- (بدون التدريب كل مرة) حفظ النموذج في ملف خارجي من أجل استخدامه  ---||

    file_model_name = 'LinearRegressionModel.bin'
    pickle.dump(lm, open(file_model_name, 'wb'))
    print("\n||---% Model Saved Successfuly %---||")

    # df.to_csv("after_Preprossecing.csv", index=False)
    # print("||---% DataSet after Preprossecing Saved Successfuly %---||")

    loaded_model = pickle.load(open(file_model_name, 'rb'))

    # |---------------------------  تقييم أداء النموذج ---------------------------|

    #  مقارنة القيم الحقيقية مع القيم المتوقعة من النموذج
    print("\n||--- Compare Real And Predict ---||")
    # Compare Real And Predict
    dfNew = pd.DataFrame({
        "y_test": y_test,
        "y_pred": y_pred
    })
    print(dfNew.head(20))
    print(dfNew.tail(20))


    print("\n\n||-------- Performance --------||\n")
    # حساب الخطأ باستخدام القيمة المطلقة للأخطاء
    print(f"<< Mean absolute Error >>: {mean_absolute_error(y_test, y_pred)} \n")
    # حساب الخطأ باستخدام القيمة المربعة للأخطاء
    print(f"<< Mean Squared Error  >>: {mean_squared_error(y_test, y_pred)} \n")
    # حساب معدل الدقة
    accuracy_score = loaded_model.score(X_test, y_test)
    print(f"<< Accuracy Score is   >>: {accuracy_score}")
    print("----------------------------------------------------------------------")


Train_Save_Model()