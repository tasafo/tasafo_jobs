# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if JobCategory.all.empty?
  JobCategory.create(name: I18n.t("categories.programming"))
  JobCategory.create(name: I18n.t("categories.system_admin"))
  JobCategory.create(name: I18n.t("categories.designer"))
  JobCategory.create(name: I18n.t("categories.business"))
  JobCategory.create(name: I18n.t("categories.other_it"))
end

programming_category = JobCategory.find_by(name: I18n.t("categories.programming"))
system_admin_category = JobCategory.find_by(name: I18n.t("categories.system_admin"))
designer_category = JobCategory.find_by(name: I18n.t("categories.designer"))
business_category = JobCategory.find_by(name: I18n.t("categories.business"))
other_it_category = JobCategory.find_by(name: I18n.t("categories.other_it"))

if Rails.env.development?
  david = User.create(email: "david@email.com", password: "123456", password_confirmation: "123456")
  maria = User.create(email: "maria@mail.com", password: "123456", password_confirmation: "123456")
  john = User.create(email: "john@mail.com", password: "123456", password_confirmation: "123456")

  Job.create(
    title: "Ruby Developer",
    company_name: "37 Signals",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "San Francisco, CA, USA",
    contact_message: "Please call me on +1 555 5555 555 or send me an email to david@37signals.com",
    site_url: "http://37signals.com",
    user: david,
    category: programming_category
    )

  Job.create(
    title: "Lead Android Developer",
    company_name: "Google",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "San Francisco, CA, USA",
    contact_message: "Please call me on +1 555 5555 555 or send me an email to maria@maria.com",
    site_url: "http://google.com",
    user: maria,
    category: programming_category
    )

  Job.create(
    title: "Senior System Manager",
    company_name: "Google",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "San Francisco, CA, USA",
    contact_message: "Please call me on +1 555 5555 555 or send me an email to maria@google.com",
    site_url: "http://google.com",
    user: maria,
    category: system_admin_category
    )

  Job.create(
    title: "Junior Designer",
    company_name: "Google",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "San Francisco, CA, USA",
    contact_message: "Please call me on +1 555 5555 555 or send me an email to maria@google.com",
    site_url: "http://google.com",
    user: maria,
    category: designer_category
    )

  Job.create(
    title: "Linux System Admin",
    company_name: "Tá Safo",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "Belém, PA",
    contact_message: "Please call me on +5 91 8889-8888 or send me an email to john@tasafo.org",
    site_url: "http://google.com",
    user: john,
    category: system_admin_category
    )

  Job.create(
    title: "Computer Maintanence",
    company_name: "Tá Safo",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "Belém, PA",
    contact_message: "Please call me on +5 91 8889-8888 or send me an email to john@tasafo.org",
    site_url: "http://google.com",
    user: john,
    category: other_it_category
    )

  Job.create(
    title: "Internet Marketing Professional",
    company_name: "Tá Safo",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "Belém, PA",
    contact_message: "Please call me on +5 91 8889-8888 or send me an email to john@tasafo.org",
    site_url: "http://google.com",
    user: john,
    category: business_category
    )

  Job.create(
    title: "Application Reseller",
    company_name: "37 Signals",
    description: "Lorem ipsum dolor sit amet, at novum partiendo nam, et esse equidem eum, sonet option saperet est at. Numquam feugait vix et. Probo singulis scripserit ex nam. At suas sanctus erroribus qui, pri ex omnis fabulas propriae. Ne vis dico sonet accommodare, graece tritani pertinacia ut mea. Duo ei voluptua gloriatur.\n\n
                  Te eum habeo eirmod. Et nec habemus pertinax interpretaris, per ut melius perpetua omittantur. Quo tibique indoctum no, meis ferri soluta vis in. Ea vis elit mutat, ex duis veniam eum. Has hinc illum prompta et, ne has utamur atomorum.\n\n
                  Eripuit constituam suscipiantur quo in. In his delectus quaerendum disputationi. Pri enim labitur platonem an, nam ad quodsi omittam suscipit, animal malorum oportere vim ut. Cum no velit ignota dolorum, erat evertitur ius an. Libris iuvaret sententiae ut cum, ea graece animal mediocritatem vis. Vix denique recusabo in, ut mel discere aliquid.",
    location: "San Francisco, CA, USA",
    contact_message: "Please call me on +5 91 8889-8888 or send me an email to john@tasafo.org",
    site_url: "http://google.com",
    user: david,
    category: business_category
    )
end