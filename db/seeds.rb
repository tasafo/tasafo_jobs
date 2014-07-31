# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

JobCategory.create(name: I18n.t("categories.programming"))
JobCategory.create(name: I18n.t("categories.system_manegement"))
JobCategory.create(name: I18n.t("categories.designer"))
JobCategory.create(name: I18n.t("categories.business"))
JobCategory.create(name: I18n.t("categories.other_it"))