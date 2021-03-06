puts "==== Create Services ===="
  Service.destroy_all
  ActiveRecord::Base.connection.execute(
    "ALTER SEQUENCE services_id_seq RESTART WITH 1"
  )

  image_path = "#{Rails.root}/app/assets/images"

  Service.create!([
    {
      title: 'Criminal Law',
      short_description: 'Short description',
      picture: File.open("#{image_path}/services/picture/thumb/missing.jpg"),
      content: 'Criminal law deals with offences against the social order. Under the common law jurisdiction, crimes disturb the sovereign and it is up to the agents of the sovereign to prosecute those offenders. Criminal law is different from civil law. The main objective of criminal law is deterrence and punishment, while that of civil law is compensation. Criminal offences contain two different elements that determine the extent of the offence – the physical act and the mental state in which the act was done. The criminal law also allows the defences to defend their acts to bring about lesser or negate their criminal responsibility and specifies the punishment appropriate for the criminal act. Criminal law does not need a victim or the consent of the victim to be prosecuted as an offender. Criminal law has been set up to regulate the behaviour of individuals and groups so that they follow the social norms. If you think you have been falsely accused of a criminal act, you might need the services of a competent and professional criminal lawyer to help you out. Since criminal laws can be quite complicated and complex, it is best to hire an experienced lawyer to ensure that the case goes in your favour.'
    },
    {
      title: 'Civil Rights Law',
      short_description: 'Short description',
      picture: File.open("#{image_path}/services/picture/thumb/missing.jpg"),
      content: 'Civil Rights are the basic rights that are provided by every citizen of the country according to the constitution. The law gives every citizen the right to practice his or her religion, speak freely and to live in the country without any discrimination based on race, religion, sex, physical or mental disability, age, immigration status and others. In addition, the law also include political rights such as the rights of the accused, the right to seek redress or legal remedy, rights to participate in politics and civil society, freedom of association, right to assemble and the right to vote, beside others. If you feel your civil rights are being breached, you can hire a civil rights attorney to provide you protection. Sometimes, you may not be sure if your rights have been violated or not. You can speak to a lawyer and understand if your case is valid or not. You need to ensure that you hire a civil right attorney that specializes in your particular case. You need to take out time to choose the right lawyer for yourself. Since, not all lawyers are equal and have the same experience; you need to hire the best to ensure that appropriate actions are taken against the accused party.'
    },
    {
      title: 'Corporate Law',
      short_description: 'Short description',
      picture: File.open("#{image_path}/services/picture/thumb/missing.jpg"),
      content: 'Today, many people are looking to start their own business. For this, they need to register their business or they might be accused of doing business illegally in the country. This is just one part of the business law. It covers a wide range of knowledge across different disciplines. Business law covers all aspects of a business, from the registration of a business to the selling of goods globally and even hiring of employees. A company may also need the services of a lawyer to ensure that the terms of agreement of sales are clearly present to the other parties. If a company wants to bid for a tender or want to obtain a project, they need to lawyer to prepare proposals that they can present to the other parties. Many times, when this is not done properly and any dispute arises, the company may suffer loss because there is no binding agreement between the two parties. Companies that fail to comply with the law may have to face serious consequences. Thus, it is important to hire a lawyer specializing in business or corporate law. Business law ensures that all companies are practicing in the correct manner and allows them to function smoothly.'
    },
    {
      title: 'Personal Injury Law',
      short_description: 'Short description',
      picture: File.open("#{image_path}/services/picture/thumb/missing.jpg"),
      content: 'Personal Injury law is designed to provide protection and legal rights to the victims who have been physically, mentally or emotionally been injured die to the carelessness or wrongdoing of another party. Personal injury laws applies to many different cases, including Cases in which a person acted out as negligent that led to the harm of another person. Some cases of these types are medical malpractice, slip and fall accidents, automobile accidents and many other toxic tort cases. Cases where a person or entity intentionally caused harm onto another person such as murder, assault or bribery.Cases where a person has unknowingly performed an act that caused harm to another person through negligence on his part. He will be still be liable for a claim by the other party. Some examples of these types include dog bite cases, product liability claims and others. Cases that involves insulting another person or insulting his character.The main purpose of personal injury law is to make sure that the injured victims get legal rights and be compensated financially for the loss and suffering they otherwise would not have to endure. Personal injury laws require people and companies to interact and perform their duties with care and attention.'
    },
    {
      title: 'Bankruptcy Law',
      short_description: 'Short description',
      picture: File.open("#{image_path}/services/picture/thumb/missing.jpg"),
      content: 'Bankruptcy law is the area of federal law that handles situations related to bankrupt persons or businesses. Under the law, a person can file bankruptcy if they are unable to pay their dues in any way. There are different chapters of the bankruptcy law and most of the individuals and business will fall under these categories. Chapter 13 of the bankruptcy law can be used by people who have the resources to pay off their debts in about 3-5 years, but not immediately. The debts of the person are not eliminated and instead they get additional time to pay off their debts. The creditors too need to comply with the rules and provide additional time for them. Chapter 7 of the bankruptcy law is the most common type of bankruptcy where the court declare the debtor to be bankrupt and all his or her assets and all properties are sold off. The money collected is then distributed among the creditors to settle their claims. This is good option for people, who have no hope of paying off their debts in any other way. It is mandatory for the debtors to pass a means test and go through counselling service before they file for bankruptcy under the bankruptcy law. The test and the counselling results are then used by the court to decide the chapter of the bankruptcy code that will work best for the situation.'
    },
    {
      title: 'Family Law',
      short_description: 'Short description',
      picture: File.open("#{image_path}/services/picture/thumb/missing.jpg"),
      content: 'Family law deals with the branch of law pertaining to all matters that are related to family unit or other domestic relations such as surrogacy, domestic partnership, marriage, divorce, child abduction, child neglect, child maintenance, paternity cases, child custody, alimony, division of family property and any other family matters. Family law is very different from other branches of law as it involves private matters. Mostly the family lawyers act as mediators and negotiators. The court too acts as a mediator and tries to reconcile members of the family to solve their issues among themselves while preserving their relationship. The law provides a structured process that allows the parties involved to resolve their disputes amicably rather than through costly lengthy litigation process that can go on for years. Modern family lawyers discourage families from going to the court as the court decision can have a win-lose outlook and can take years to solve the issue. In collaborative family law, mediated by an experienced lawyer, disputes are settled amicably so that everyone wins something. It not only helps families to stay together, but also is less stressful for the family lawyers. It results in speedy resolution of disputes within the family without going to the court.'
    }
  ])

puts "==== End ===="
