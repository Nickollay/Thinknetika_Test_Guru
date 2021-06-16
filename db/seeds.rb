# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([ { type: :Admin,
                         email: :'admin@test-guru.com',
                         password: ENV.fetch('ADMIN_PASSWORD'),
                         first_name: :'Boss',
                         last_name: :'Ugu'
                       },
                       { type: :User,
                         email: :'user@test-guru.com',
                         password: ENV.fetch('USER_PASSWORD'),
                         first_name: :'Trier',
                         last_name: :'Once'
                       }
                     ])

users.each(&:confirm)

categories = Category.create!([ { title: :Front },
                                { title: :Back },
                                { title: :Mobile }
                              ])

tests = Test.create!([ { title: :React, level: 2, category: categories[0], creator: users[0] },
                       { title: :JS,    level: 1, category: categories[0], creator: users[0] },
                       { title: :Ruby,  level: 2, category: categories[1], creator: users[0] },
                       { title: :RoR,   level: 1, category: categories[1], creator: users[0] },
                       { title: :IOS,   level: 2, category: categories[2], creator: users[0] }
                     ])

questions = Question.create!([ { body: "Jolly, yo-ho-ho.",
                                 test: tests[0] },
                               { body: "Be fraternal for whoever dies, because each has been emerged with result.",
                                 test: tests[0] },
                               { body: "The moon is quickly collective.",
                                 test: tests[0] },
                               { body: "Ecce.",
                                 test: tests[1] },
                               { body: "To some, a body is a density for fearing.",
                                 test: tests[1] },
                               { body: "The lubber blows with desolation, break the freighter until it waves.",
                                 test: tests[1] },
                               { body: "The processor flies mineral like a united teleporter.",
                                 test: tests[2] },
                               { body: "Yes, there is zion, it lures with suffering.",
                                 test: tests[2] },
                               { body: "Urbs messiss, tanquam velox resistentia.",
                                 test: tests[2] },
                               { body: "How clear. You love like a skiff.",
                                 test: tests[3] },
                               { body: "This love has only been transfered by a final space suit.",
                                 test: tests[3] },
                               { body: "Mix the nachos with packaged radish sprouts, chipotle chile powder, curry, and green curry making sure to cover all of it.",
                                 test: tests[3] },
                               { body: "The doubloons fears with passion, view the freighter until it sings.",
                                 test: tests[4] },
                               { body: "Arg, yer not blowing me without a pestilence!",
                                 test: tests[4] },
                               { body: "Tofu can be seasoned with tasty melon, also try whisking the punch with emeril's essence.",
                                 test: tests[4] }
                             ])

answer = Answer.create!([ { body: "Cum impositio studere, omnes nutrixes talem bassus, salvus guttuses.",
                            correct: :true,  question: questions[1] },
                          { body: "Belay! Pieces o' halitosis are forever rainy.",
                            correct: :false, question: questions[2] },
                          { body: "Aliens resist with procedure at the modern colony!",
                            correct: :true,  question: questions[3] },
                          { body: "Try garnishing the celery juice sausagess with crushed fish sauce and soy sauce, warmed.",
                            correct: :false, question: questions[4] },
                          { body: "Season the truffels with crushed za'atar, butterscotch, chipotle chile powder, and cumin making sure to cover all of it.",
                            correct: :true,  question: questions[5] },
                          { body: "Squid combines greatly with fresh apple.",
                            correct: :false, question: questions[6] },
                          { body: "Faith, stigma and a boundless pyramid.",
                            correct: :true,  question: questions[7] },
                          { body: "When one meets uniqueness and acceptance, one is able to view control.",
                            correct: :false, question: questions[8] },
                          { body: "Golly gosh, well.",
                            correct: :true,  question: questions[9] },
                          { body: "Hippotoxotas volare in quadrata!",
                            correct: :false, question: questions[10] },
                          { body: "Engage.",
                            correct: :true,  question: questions[11] },
                          { body: "Tremble without tragedy, and we won’t avoid a ship.",
                            correct: :false, question: questions[12] },
                          { body: "Fun imperium.",
                            correct: :true,  question: questions[13] },
                          { body: "Nunquam imperium brabeuta.",
                            correct: :false, question: questions[14] },
                          { body: "Per guest prepare seven teaspoons of joghurt with roasted marshmellow for dessert.",
                            correct: :true,  question: questions[0] },
                          { body: "Never invent the believer, for you cannot hurt it.",
                            correct: :false,  question: questions[1] },
                          { body: "The uniqueness of knowing selfs is fraternal.",
                            correct: :true, question: questions[2] },
                          { body: "The cannibal pulls with urchin, endure the lighthouse!",
                            correct: :false,  question: questions[3] },
                          { body: "Assimilation at the ready room was the beauty of life, attacked to a solid lieutenant commander.",
                            correct: :true, question: questions[4] },
                          { body: "Calcaria regius mons est. Brodium, nutrix, et habena. Mirabilis, varius caniss grauiter reperire de secundus, gratis repressor.",
                            correct: :false,  question: questions[5] },
                          { body: "Rainy hungers lead to the beauty.",
                            correct: :true, question: questions[6] },
                          { body: "The satori is a special wind.",
                            correct: :false,  question: questions[7] },
                          { body: "The corsair endures with halitosis, scrape the quarter-deck before it dies.",
                            correct: :true, question: questions[8] },
                          { body: "Space suits reproduce with shield.",
                            correct: :false,  question: questions[9] },
                          { body: "Prime enlightenments forgets most purposes!",
                            correct: :true, question: questions[10] },
                          { body: "Alignment.",
                            correct: :false,  question: questions[11] },
                          { body: "Scurvy, mighty golds quirky desire a real, rough pin.",
                            correct: :true, question: questions[12] },
                          { body: "",
                            correct: :false,  question: questions[13] },
                          { body: "With chilis drink salsa verde.",
                            correct: :true, question: questions[14] },
                          { body: "The scallywag endures with riddle, scrape the quarter-deck before it laughs.",
                            correct: :false,  question: questions[0] }
                        ])

tests_users = TestPassage.create!([ { user: users[1], test: tests[1] },
                                  { user: users[0], test: tests[2] },
                                  { user: users[1], test: tests[3] },
                                  { user: users[0], test: tests[4] },
                                  { user: users[1], test: tests[0] }
                                ])
