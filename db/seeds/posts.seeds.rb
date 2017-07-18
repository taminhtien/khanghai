after :users, :categories do
  puts "==== Create Posts ===="
    Post.destroy_all
    ActiveRecord::Base.connection.execute(
      "ALTER SEQUENCE posts_id_seq RESTART WITH 1"
    )

    image_path = "#{Rails.root}/app/assets/images"

    category = Category.first
    user = User.first

    Post.create!([
      {
        title: '6 tips to avoid expensive legal advice',
        content: 'If you need legal advice for your business or personal matters, hiring quality and professional lawyers may cost you lot of money. But, it is always advisable to opt for quality legal services. here are some tips that will help you to avoid high cost of legal advice. If you belong to the low-income group, you can make use of large network of legal aid programs that operates on federal agents. You can use these programs and get free legal advice for your problem. We can also help you with lawsuits against negligent parties for different issues such as inadequate security, wrong hiring practices and also lawsuits against schools, companies, nursing homes, employers, hotels, apartment complexes, say care centres and more. You can get quotation from several lawyers and choose the one that best fits your budget. But ensure that you choose a competent lawyer by interviewing them before hiring. Remember that an efficient lawyer can make a big difference to your case, so it is important that you spend some time in finding the best lawyer to seek advice from for your legal matters. We can also help you with lawsuits against negligent parties for different issues such as inadequate security, wrong hiring practices and also lawsuits against schools, companies, nursing homes, employers, hotels, apartment complexes, say care centres and more. Many online self-help legal websites provide free legal advice to people. You can submit your questions online on these websites and then they are answered by lawyers or paralegals',
        user: user,
        category: category
      },
      {
        title: 'Nothing is more expensive than a cheap lawyer',
        content: 'If you belong to the low-income group, you can make use of large network of legal aid programs that operates on federal agents. You can use these programs and get free legal advice for your problem. Many online self-help legal websites provide free legal advice to people. You can submit your questions online on these websites and then they are answered by lawyers or paralegals. If you are a victim of crime, you need the help of a professional lawyer who is responsive and compassionate. While you cannot stop crime from happening, you can help others as your lawsuits against the responsible perpetrator will help them to improve their security and ensure that such crimes do not happen in the future. We can also help you with lawsuits against negligent parties for different issues such as inadequate security, wrong hiring practices and also lawsuits against schools, companies, nursing homes, employers, hotels, apartment complexes, say care centres and more.',
        user: user,
        category: category
      },
      {
        title: 'Family law act best interests of child',
        content: 'If you are a victim of crime, you need the help of a professional lawyer who is responsive and compassionate.  While you cannot stop crime from happening, you can help others as your lawsuits against the responsible perpetrator will help them to improve their security and ensure that such crimes do not happen in the future. You can get quotation from several lawyers and choose the one that best fits your budget. But ensure that you choose a competent lawyer by interviewing them before hiring. Remember that an efficient lawyer can make a big difference to your case, so it is important that you spend some time in finding the best lawyer to seek advice from for your legal matters. Starting a new venture can be exciting and challenging. It is important that you hire a lawyer too as all companies, irrespective of their size needs legal representation. When you start your business, you will find that you need legal guidance at every step and at different phases of the business life, from the initial incorporation to raising capital for expansion to hiring employees, you need the services of a good lawyer. It goes without saying that most businessmen cannot handle the legal matters in a way that professional and competent lawyers can.',
        user: user,
        category: category
      }
    ])

  puts "==== End ===="
end
