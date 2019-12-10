//
//  MockManager.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 22.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Moya

final class MockManager: Networkable {
    var client: MoyaProvider<DrsAPI>!
    
    // MARK: - #Login Mock
    #if DEBUG
    fileprivate func loginData() -> String {
        return """
        {
        "status": "success",
        "status_code": 200,
        "data": {
        "uid": "18A58B65-19B9-3959-B95A-B653CDD5D3A3",
        "tcno": "36123503722",
        "email": "yonetici@mizactemelliegitim.com",
        "name": "Polat Pekkan",
        "gender": "Male",
        "birthdate": "2001-09-16",
        "roles": [
        {
        "uid": "6EA5716D-5B92-4D12-87EB-E27C8140A580",
        "slug": "manager",
        "name": "Yönetici",
        "school": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
        "school_name": "Mizmer",
        "unit": null,
        "unit_name": null
        },
        {
        "uid": "5DBD4040-768C-4388-9BEB-DD731C946546",
        "slug": "parent",
        "name": "Veli",
        "school": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
        "school_name": "Mizmer",
        "unit": "1",
        "unit_name": "Okul Öncesi"
        },
        {
        "uid": "07EE987C-AF1E-461D-BC2D-B67B388EFAE6",
        "slug": "guidanceteacher",
        "name": "Rehber Öğretmen",
        "school": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
        "school_name": "Mizmer",
        "unit": "1",
        "unit_name": "Okul Öncesi"
        }
        ],
        "token":  "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkubWl6YWN0ZW1lbGxpZWdpdGltLmNvbVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NzI0MTkyMDMsImV4cCI6MTU3MzAyNDAwMywibmJmIjoxNTcyNDE5MjAzLCJqdGkiOiJoS2xMWVFvMUp1TG1EY0sxIiwic3ViIjoyMCwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.shkbAtOe9L_7tBNs3l9wvPeXpgPw_Us3q8wBN6gdAFE",
        "temperament": {
        "name": "Topluma Dönük DTM6 Topluma Dönük DTM5",
        "motivation": "Entellektüel Dinginlik Arayışı",
        "base": "DTM:6-5"
        }
        }
        }
        """
    }
    
    func defaultLoginPageConfigurer(userName: String, password: String, completion: @escaping (Result<Login, Error>) -> Void) {
        //ogrveli@mizactemelliegitim.com
        //if userName == "yonetici@mizactemelliegitim.com" && password == "12345"
        if userName == "test" && password == "test" {
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Login.self, from: loginData().data(using: .utf8)!)
                completion(.success(result))
                
            } catch let error {
                completion(.failure(error))
                print("#Error - Login \(error)")
                
            }
        }
    }
    
    var startTemperamentTestJSON = """
{
    "status": "success",
    "status_code": 200,
    "data": {
        "page": "main",
        "type": 3,
        "survey": "4dd53229-dc38-4c3e-a4bc-3281a1db8cd6",
        "questions": [
            {
                "id": 3,
                "text": "Kendimi bildim bileli; hırslı, özgüveni yüksek, başarı odaklı ve üretken biriyimdir. Çevremdekileri hayran bırakacak popüler bir imaj ve görünüme sahip olmaya çok önem veririm. Benim için kariyer, statü ve prestij sahibi olmak olmazsa olmaz konuların başında gelir. İlişki kurduğum kişileri de buna göre seçerim. Hayatımın her alanında yarışma ve rekabet vardır. Çevremdekileri de çalışıp başarılı olmaları yönünde çok kolay motive ederim. Hedefe ulaşmak için durmaksızın hırsla çalışabilirim ve her yolu denerim. Her ne kadar umursamıyor gibi görünsem de başarısızlığı asla hazmedemem. Usül ve kurallara çok takılmadan daima pratik yoldan sonuca ulaşmaya çalışırım. Her ortama ayak uydurur, amaca yönelik hedef odaklı ilişki kurarım. Kolay pes etmem, manipülatif hamlelerimle her olayın altından kalkabilirim. Olumsuz duygulara pek takılmam."
            },
            {
                "id": 6,
                "text": "Kendimi bildim bileli; güven ve emniyet odaklı biriyimdir. Tedbiri elden pek bırakmam, kontrollü güvenirim. Yeni bir ortama girdiğimde önce çevremi gözlemler, güven ortamının oluşmasıyla uyum sağlarım. Sadakat ve bağlılık hayatımdaki en öncelikli konuların başında gelir. Yaşamımda bana daima destek olacağından emin olduğum; bilgili, kararlı ve tutarlı bir güven odağına ihtiyaç duyarım. Duygularıma önem versem de mantığımı elden bırakmayan garantici biriyimdir. Olumlu olumsuz tüm ihtimalleri hesaplayan sorgulayıcı bir zihin yapısına sahibim. Dolayısıyla en kötü ihtimale karşı kendimi hazırlamaya çalışırım. Kafamın rahat etmesi için her türlü veriye sahip olmak isterim. Herhangi bir şeye hemen karar veremeyebilirim ya da verdiğim karardan emin olamayabilirim. Belirsizlikler ya da gelecekle ilgili çevremdeki kişilere oranla daha kolay kaygılanabilen bir yapıya sahibimdir."
            },
            {
                "id": 9,
                "text": "Kendimi bildim bileli; çok uyumlu, sakin, gerilim ve huzursuzluktan hiç hoşlanmayan biriyimdir. Rahatımın yerinde olması ve günlük ihtiyaçlarımı rutin bir düzende karşılamak benim için çok önemlidir. Tartışmadan, barış ve uzlaşma içinde yaşarım. Daima sakinliğimi korur, kontrolcü bir tavır sergilemeden olayları akışına bırakırım.  Çevremde gerçekleşen çatışmalarda arabulucu bir rol alırım. Esnek, yargılamadan algılamaya önem veren mülayim yapımla çevremdekilere huzur veririm. İşleri rutin bir düzen içinde yapar, ani, beklenmedik değişimlerden, acele ettirilmekten rahatsız olurum. Herhangi bir işe zorlandığımda o işi yapmayı reddetmem ancak sürekli ertelerim. Çevremdekilerle aramdaki uyumu korumak adına hayır demekte zorlanırım. Öfkelensem bile öfkemi ifade etmez, bastırırım. Ancak nadiren de olsa beklenmedik zamanlarda öfke patlamaları yaşayabilirim."
            },
            {
                "id": 2,
                "text": "Kendimi bildim bileli; çok duygusal, sevgi dolu ve sıcakkanlı biriyim. İlişkiler içinde var olurum ve ilişkilerimi çok fazla umursarım. Duygusal yapım nedeniyle hemen kaynaşabilen, arkadaş canlısı biriyimdir. İlgi ve dikkat çekmekten çok hoşlanırım. Çevremdekilerin ihtiyaç ve beklentilerini çok çabuk fark eder, kendimi yardım etmek zorunda hissederim. Başkalarının mutluluğuyla çok yakından ilgilenirim. Sevdiklerimin dertleriyle kendi dertlerim gibi ilgilenir, problemlerini çözmek için kendi ihtiyaçlarımı göz ardı edebilirim. Onlardan da aynı değeri beklerim. Çok kolay alınganlık gösterebilirim ama yine de uzun süre küs kalamam. Ancak çok gururluyumdur. Gururum incindiğinde o ilişkiye ne kadar sıkı bağlı olsam da ilişkiyi sonlandırabilirim."
            },
            {
                "id": 5,
                "text": "Kendimi bildim bileli; içe dönük, soğuk, mesafeli ve yalnız kalıp düşünmekten hoşlanan biriyimdir. İnsanlarla ilişki kurmak ve paylaşım içinde olmak konusunda çekingen ve isteksizimdir. Fiziksel temas, duygusal tavır ve tepkilerden kaçınırım. Genellikle ortama dâhil olmadan sessizce çevreyi gözlemlerim. Dikkat çekmek ve göz önünde olmaktan oldukça rahatsız olurum.  Duygusallıktan çok rasyonel, mantıklı ve analitik düşünen bir yapım vardır. Kendi halimde düşünmekten çok keyif alırım. Bilgiye ve bilgide derinleşmeye çok önem veririm. Olayları, kişileri ve kavramları duygularımı katmadan objektif bir biçimde değerlendirir, derinlemesine analiz ederim. İnsanların düşünceleri bana genellikle basit ve yüzeysel gelir, benim derin, soyut, kavramsal düşünce dünyamı anlamayacaklarını düşünürüm. Bilgiyi teorik olarak çok iyi kavrasam da pratik yaşama uygulanması konusunda isteksiz ve yetersiz olabilirim."
            },
            {
                "id": 8,
                "text": "Kendimi bildim bileli; cesur, her şart ve durumda atılgan, geride durmaktan asla hoşlanmayan, lider tabiatlı biriyimdir. Net ve dobra bir kişiyimdir. Duygu ve düşüncelerimi söylemekten çekinmem. Kararlarım çok nettir, hayatımda grilere yer yoktur. Kararsızlık, zayıflık ve pasiflikten asla hoşlanmam. Gücümü ortaya koyabilmek için risk alan, girişken ve iddialı biriyimdir. Bir problemle karşılaştığımda derhal eyleme geçer, yılmadan metanetle mücadele ederim. Zayıf ve muhtaç duruma düşmekten ve kontrol edilmekten çok rahatsız olurum. Hâkimiyet ve otoritemi her koşulda kabul ettirmek isterim. Himaye ettiklerime karşı son derece cömert ve sahipleniciyimdir. Bana ya da yakınlarıma zarar vermeye çalışanları asla affetmem, tehlikeyi hızlı sezen yapımla hiç düşünmeden karşı koyarım.Çocukluğumdan bu yana çatışma ve kavgadan hiç çekinmem.  Öfkemi hemen dışa vururum. Çok çabuk parlayıp, sönerim."
            },
            {
                "id": 1,
                "text": "Kendimi bildim bileli; ciddi, disiplinli, tutum ve davranışlarımda daima ölçülü olmaya dikkat eden biriyimdir. Temiz ve düzenli olmaya her koşulda çok önem veririm. Ahlak, nezaket ve görgü kurallarına uygun davranılmasına her zaman çok dikkat ederim. Adil, ilkeli ve prensip sahibi olmak hayatımdaki en olmazsa olmaz konuların başında gelir. Bir iş hatasız, eksiksiz ve düzgün bir biçimde yerine getirilmelidir. En ufak hata ve eksiği detaylarıyla derhal fark eder, mutlaka düzeltmeye gayret ederim. Planlı, programlı ve dakik bir biçimde çalışılması benim için çok önemlidir. Bana göre her şey, usulü neyse ona göre yapılmalıdır. Usulsüzlük, adaletsizlik veya bir iş düzgün yapılmadığı durumlarda kolay kızıp gerilebilirim. Hatta kendimden başlayarak tüm sistemi eleştirip yargılayabilirim."
            },
            {
                "id": 4,
                "text": "Kendimi bildim bileli; içe dönük, nahif, duyarlı ve empatik biriyimdir. Her ne kadar karşımdakiler duygularımın derin yoğunluğunu kolay fark edemeseler de, yoğun duygulara ve romantik bir hayal dünyasına sahibimdir. İçimden geldiği gibi hissettiklerim doğrultusunda yaşarım. Doğal, kendine özgü, farklı ve sıra dışı bir tarzım vardır. Duygularımı direkt ifade etmektense dolaylı yollarla özellikle estetik bir tasarım veya sanatsal bir biçimde ifade ederim. İdeallerime ve ilişkilerime tutkulu ve romantik bir biçimde bağlıyımdır. Herkesle dostane ilişkiler kurabilsem de yalnız kalıp kendi içime dönme ihtiyacı hissederim. İçimde daima bir anlam arayışı, boşluk hissi ve melankoli vardır. Çocukluğumdan bu yana nedenini bilemediğim; hüzün-sevinç, coşku-melankoli gibi duygusal iniş çıkışları çok sık yaşarım."
            },
            {
                "id": 7,
                "text": "Kendimi bildim bileli; dışa dönük, enerjik, hareketli, neşeli, muzip ve eğlenceli biriyimdir. Hayattan keyif almaya odaklanır, monotonluk ve rutinden çok çabuk sıkılırım. Aklımın estiği şekilde yaşamın tadını çıkarmaya eğilimliyimdir. Yeni şeyler öğrenmek ve deneyimlemek bana büyük bir haz verir. Farklı konular arasında hemen bağlantı kurabilen, yaratıcı fikirler üretebilen (inovatif) yenilikçi ve vizyoner biriyimdir. Aklıma sürekli farklı proje ve fikirler gelir. Zihnim aynı anda birçok şeyle ilgilendiğinden dolayı dikkatim çabuk dağılabilir.  Sorunlar karşısında genellikle iyimser bir bakış açısına sahip, pratik ve çözüm odaklı biriyimdir. Genellikle olumsuz ihtimalleri dert etmek yerine, beni sıkıntıya sokacak durumlardan uzak dururum. Sınır ve engellenmelere karşı toleransım düşüktür. Sabırsızımdır; bende merak uyandıran bir şeyi hemen deneyimlemek ister, sonrasında çabuk sıkılıp tüketebilirim."
            }
        ]
    }
}
"""
    func fetchTemperamentTestQuestions(userId: String, token: String, completion: @escaping (Result<Question, Error>) -> Void) {
        if !token.isEmpty && !userId.isEmpty {
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(Question.self, from: startTemperamentTestJSON.data(using: .utf8)!)
                completion(.success(result))
                
            } catch {
                completion(.failure(error))
                
            }
            
        }
    }
    
    var mainQuestionResponse = """
{
    "status": "success",
    "status_code": 200,
    "data": {
        "page": "extension",
        "type": 3,
        "survey": "41b05ee1-b298-4155-875a-6b9f289ecbf1",
        "questions": [
            {
                "id": 9,
                "text": "Daha dikkat çekici ve dışa dönük biriyimdir. Çevremdekilerle daha sıcak ve yakın ilişkiler kurarım. Sosyal becerilerim çok yüksektir, istediğim her ortama adapte olabilirim. İlişki kurduğum herkesi kolay yönlendirebilirim. Daha alıngan olmam nedeniyle ani duygusal tepkiler verip hırçınlaşabilirim."
            },
            {
                "id": 10,
                "text": "Daha içe dönük ve yalnızlıktan da hoşlanan biriyimdir. Kendine özgü, farklı bir estetik tarzım vardır. Dikkat çekiciliğin yanında özgün olmaya da önem veririm. Kendi içimde yoğun duygusal bir yanım da vardır ancak bunu kolay ifade edemem. Bu nedenle zaman zaman duygusal karmaşalar yaşayabilirim."
            }
        ]
    }
}
"""
    /// send user answers
    func sendTestAnswer(userId: String, token: String, userAnswers: Any?, completion: @escaping (Result<Question, Error>) -> Void) {
        if !token.isEmpty && !userId.isEmpty {
            let decoder  = JSONDecoder()
            do {
                let res = try decoder.decode(Question.self, from: mainQuestionResponse.data(using: .utf8)!)
                completion(.success(res))
                
            } catch {
                completion(.failure(error))
                
            }
        }
    }
    
    var classList = """
{
    "status": "success",
    "status_code": 200,
    "data": [
        {
            "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
            "name": "Papatya",
            "grade": "0",
            "branch": "Papatya",
            "capacity": "12",
            "plan_columns": null,
            "plan_seats": null,
            "total_students": "1",
            "teacher_id": "20",
            "classroom_id": "1",
            "school": {
                "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                "name": "Mizmer"
            },
            "unit": {
                "id": "1",
                "name": "Okul Öncesi"
            },
            "teachers": {
                "guidance_teacher": {
                    "uid": "18A58B65-19B9-3959-B95A-B653CDD5D3A3",
                    "name": "Polat Pekkan",
                    "email": "ogrveli@mizactemelliegitim.com",
                    "tcno": "36123503722",
                    "gender": "Male",
                    "birthdate": "2001-09-16",
                    "branch": "Rehberlik",
                    "temperament_status": "Unsolved",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                },
                "classroom_teacher": {
                    "uid": "CC75C307-A87F-3E37-B7FD-1AA210FFE7AB",
                    "name": "Ferid Fahri",
                    "email": "irem90@example.net",
                    "tcno": "29793807320",
                    "gender": "Male",
                    "birthdate": "1993-07-19",
                    "branch": "Sınıf Öğretmeni",
                    "temperament_status": "Unsolved",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                }
            }
        },
        {
            "uid": "FF3D91EE-D279-43B7-A763-65DC2A370D53",
            "name": "Açelya",
            "grade": "0",
            "branch": "Açelya",
            "capacity": "12",
            "plan_columns": null,
            "plan_seats": null,
            "total_students": "1",
            "teacher_id": "20",
            "classroom_id": "2",
            "school": {
                "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                "name": "Mizmer"
            },
            "unit": {
                "id": "1",
                "name": "Okul Öncesi"
            },
            "teachers": {
                "guidance_teacher": {
                    "uid": "18A58B65-19B9-3959-B95A-B653CDD5D3A3",
                    "name": "Polat Pekkan",
                    "email": "ogrveli@mizactemelliegitim.com",
                    "tcno": "36123503722",
                    "gender": "Male",
                    "birthdate": "2001-09-16",
                    "branch": "Rehberlik",
                    "temperament_status": "Unsolved",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                },
                "classroom_teacher": {
                    "uid": "B5CFBA30-C81C-3DD0-993E-C4D29CC68AA3",
                    "name": "Berkay Erçetin",
                    "email": "babaoglu.esma@example.com",
                    "tcno": "12104760742",
                    "gender": "Male",
                    "birthdate": "1931-09-26",
                    "branch": "Sınıf Öğretmeni",
                    "temperament_status": "Unsolved",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                }
            }
        },
        {
            "uid": "630169CC-1881-4541-9287-463F6C74626C",
            "name": "Akasya",
            "grade": "0",
            "branch": "Akasya",
            "capacity": "12",
            "plan_columns": null,
            "plan_seats": null,
            "total_students": "1",
            "teacher_id": "20",
            "classroom_id": "3",
            "school": {
                "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                "name": "Mizmer"
            },
            "unit": {
                "id": "1",
                "name": "Okul Öncesi"
            },
            "teachers": {
                "guidance_teacher": {
                    "uid": "18A58B65-19B9-3959-B95A-B653CDD5D3A3",
                    "name": "Polat Pekkan",
                    "email": "ogrveli@mizactemelliegitim.com",
                    "tcno": "36123503722",
                    "gender": "Male",
                    "birthdate": "2001-09-16",
                    "branch": "Rehberlik",
                    "temperament_status": "Unsolved",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                },
                "classroom_teacher": {
                    "uid": "259AD04C-8703-32AF-939E-753EC3C1F345",
                    "name": "Esma Akal",
                    "email": "ztekand@example.org",
                    "tcno": "68705505770",
                    "gender": "Female",
                    "birthdate": "2013-06-06",
                    "branch": "Sınıf Öğretmeni",
                    "temperament_status": "Unsolved",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                }
            }
        }
    ]
}

"""
    
    /// fetch all class list
    func fetchClassList(roleID: String, token: String, completion: @escaping (Result<ClassData, Error>) -> Void) {
        if !roleID.isEmpty && !token.isEmpty {
            let decoder = JSONDecoder()
            do {
                
                let result = try decoder.decode(ClassData.self, from: classList.data(using: .utf8)!)
                completion(.success(result))
                
            } catch let error {
                print(error)
                completion(.failure(error))
            }
        }
        
    }
    
    func fetchStudentsOfTheClass(roleID: String, classRoomId: String, token: String, completion: @escaping (Result<StudentsOfTheClass, Error>) -> Void) {
        if !roleID.isEmpty && !classRoomId.isEmpty && !token.isEmpty {
            let decoder = JSONDecoder()
            do {
                
                let result = try decoder.decode(StudentsOfTheClass.self, from: studentList.data(using: .utf8)!)
                completion(.success(result))
                
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    #endif
}
    var studentList = """
{
        "status": "success",
        "status_code": 200,
        "data": {
            "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
            "name": "Papatya",
            "grade": "0",
            "branch": "Papatya",
            "capacity": "12",
            "plan_columns": null,
            "plan_seats": null,
            "total_students": "1",
            "school": {
                "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                "name": "Mizmer"
            },
            "unit": {
                "id": "1",
                "name": "Okul Öncesi"
            },
            "teachers": {
                "guidance_teacher": {
                    "uid": "18A58B65-19B9-3959-B95A-B653CDD5D3A3",
                    "name": "Polat Pekkan",
                    "email": "ogrveli@mizactemelliegitim.com",
                    "tcno": "36123503722",
                    "gender": "Male",
                    "birthdate": "2001-09-16",
                    "branch": "Rehberlik",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                },
                "classroom_teacher": {
                    "uid": "CC75C307-A87F-3E37-B7FD-1AA210FFE7AB",
                    "name": "Ferid Fahri",
                    "email": "irem90@example.net",
                    "tcno": "29793807320",
                    "gender": "Male",
                    "birthdate": "1993-07-19",
                    "branch": "Sınıf Öğretmeni",
                    "created_at": "2019-07-01 09:00:10.317",
                    "deleted_at": null
                }
            },
            "students": [
                {
                    "uid": "3775C771-2828-3CAD-9A0D-81FD3E89C46A",
                    "name": "Şahnur Mertoğlu0",
                    "email": "sahnur.mertoglu@example.org",
                    "tcno": "14642549308",
                    "gender": "Female",
                    "birthdate": "1924-08-29",
                    "temperament": {
                        "status": "Solved",
                        "base": "DTM:6",
                        "name": "DTM:6",
                        "motivation": "Entellektüel Dinginlik Arayışı"
                    },
                    "school": {
                        "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                        "name": "Mizmer",
                        "number": "101"
                    },
                    "unit": {
                        "id": "1",
                        "name": "Okul Öncesi"
                    },
                    "classroom": {
                        "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                        "name": "Papatya"
                    },
                    "teachers": null
                },
                        {
                          "uid": "0A360852-B692-3BE1-846E-3F35EF996095",
                          "name": "Utku Çapanoğlu",
                          "email": "yozberk@example.net",
                          "tcno": "43954353174",
                          "gender": "Male",
                          "birthdate": "2007-06-12",
                          "temperament": {
                            "status": "Solved",
                            "base": "DTM:6",
                            "name": "DTM:6",
                            "motivation": "Entellektüel Dinginlik Arayışı"
                          },
                          "school": {
                            "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                            "name": "Mizmer",
                            "number": "101"
                          },
                          "unit": {
                            "id": "1",
                            "name": "Okul Öncesi"
                          },
                          "classroom": {
                            "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                            "name": "Papatya"
                          },
                          "teachers": null
                        },
                           {
                    "uid": "3775C771-2828-3CAD-9A0D-81FD3E89C46A",
                    "name": "Şahnur Mertoğlu2",
                    "email": "sahnur.mertoglu@example.org",
                    "tcno": "14642549308",
                    "gender": "Female",
                    "birthdate": "1924-08-29",
                    "temperament": {
                        "status": "Solved",
                        "base": "DTM:6",
                        "name": "DTM:6",
                        "motivation": "Entellektüel Dinginlik Arayışı"
                    },
                    "school": {
                        "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                        "name": "Mizmer",
                        "number": "101"
                    },
                    "unit": {
                        "id": "1",
                        "name": "Okul Öncesi"
                    },
                    "classroom": {
                        "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                        "name": "Papatya"
                    },
                    "teachers": null
                },
                         {
                             "uid": "02EC07DE-DAA3-3643-B30E-2C9D239C0D9A",
                             "name": "İrem Gönültaş",
                             "email": "adan.derin@example.net",
                             "tcno": "31920226768",
                             "gender": "Female",
                             "birthdate": "1995-03-15",
                             "temperament": {
                               "status": "Solved",
                               "base": "DTM:6",
                               "name": "DTM:6",
                               "motivation": "Entellektüel Dinginlik Arayışı"
                             },
                             "school": {
                               "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                               "name": "Mizmer",
                               "number": "101"
                             },
                             "unit": {
                               "id": "1",
                               "name": "Okul Öncesi"
                             },
                             "classroom": {
                               "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                               "name": "Papatya"
                             },
                             "teachers": null
                           },
                           {
                    "uid": "3775C771-2828-3CAD-9A0D-81FD3E89C46A",
                    "name": "Şahnur Mertoğlu4",
                    "email": "sahnur.mertoglu@example.org",
                    "tcno": "14642549308",
                    "gender": "Female",
                    "birthdate": "1924-08-29",
                    "temperament": {
                        "status": "Solved",
                        "base": "DTM:6",
                        "name": "DTM:6",
                        "motivation": "Entellektüel Dinginlik Arayışı"
                    },
                    "school": {
                        "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                        "name": "Mizmer",
                        "number": "101"
                    },
                    "unit": {
                        "id": "1",
                        "name": "Okul Öncesi"
                    },
                    "classroom": {
                        "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                        "name": "Papatya"
                    },
                    "teachers": null
                },
                           {
                    "uid": "3775C771-2828-3CAD-9A0D-81FD3E89C46A",
                    "name": "Şahnur Mertoğlu5",
                    "email": "sahnur.mertoglu@example.org",
                    "tcno": "14642549308",
                    "gender": "Female",
                    "birthdate": "1924-08-29",
                    "temperament": {
                        "status": "Solved",
                        "base": "DTM:6",
                        "name": "DTM:6",
                        "motivation": "Entellektüel Dinginlik Arayışı"
                    },
                    "school": {
                        "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                        "name": "Mizmer",
                        "number": "101"
                    },
                    "unit": {
                        "id": "1",
                        "name": "Okul Öncesi"
                    },
                    "classroom": {
                        "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                        "name": "Papatya"
                    },
                    "teachers": null
                },
                           {
                    "uid": "3775C771-2828-3CAD-9A0D-81FD3E89C46A",
                    "name": "Şahnur Mertoğlu6",
                    "email": "sahnur.mertoglu@example.org",
                    "tcno": "14642549308",
                    "gender": "Female",
                    "birthdate": "1924-08-29",
                    "temperament": {
                        "status": "Solved",
                        "base": "DTM:6",
                        "name": "DTM:6",
                        "motivation": "Entellektüel Dinginlik Arayışı"
                    },
                    "school": {
                        "uid": "2124B4A4-47A8-30D1-ACFE-B0FA251D861A",
                        "name": "Mizmer",
                        "number": "101"
                    },
                    "unit": {
                        "id": "1",
                        "name": "Okul Öncesi"
                    },
                    "classroom": {
                        "uid": "AB5482C9-702F-4F97-B1E3-0D68F146F24D",
                        "name": "Papatya"
                    },
                    "teachers": null
                }
            ],
            "ratios": {
                "gender": {
                    "male": 0,
                    "female": 100
                },
                "temperament": {
                    "DTM:6": 1
                }
            }
        }
    }
"""
