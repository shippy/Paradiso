source = "DRST 002_01_(22261)_Literature_Christopher Semk_MW 1.00-2.15_WLH 001
DRST 002_02_(22262)_Literature_Virginia Jewiss_TTh  9.00-10.15_LC 210
DRST 002_03_(22259)_Literature_Henry Sussman_TTh  2.30-3.45_YK220 002
DRST 002_04_(22260)_Literature_Mark Bauer_TTh  2.30-3.45_WLH 202
DRST 002_05_(22257)_Literature_Jane Levin_TTh  9.00-10.15_WLH 204
DRST 002_06_(22258)_Literature_R. Howard Bloch_TTh  2.30-3.45_LC 318
DRST 002_07_(22256)_Literature_Jan Hagens_MW 2.30-3.45_LC 210
DRST 004_01_(22264)_Philosophy_Gregory Ganssle_TTh  11.35-12.50_LC 103
DRST 004_02_(22263)_Philosophy_Paul Franks_TTh  11.35-12.50_WLH 001
DRST 004_03_(22266)_Philosophy_MaTTh ew Smith_TTh  11.35-12.50_WLH 202
DRST 004_04_(22265)_Philosophy_Barbara Sattler_TTh  11.35-12.50_WLH 204
DRST 004_05_(22267)_Philosophy_Brian Kane_TTh  11.35-12.50_WLH 211
DRST 004_06_(22268)_Philosophy_Scott Edgar_TTh  11.35-12.50_HGS 217B
DRST 004_07_(22269)_Philosophy_Jay Elliott_TTh  11.35-12.50_HGS 218
DRST 006_01_(22273)_History & Political Thought_Norma Thompson_MW 9.00-10.15_LC 105
DRST 006_02_(22272)_History & Political Thought_Helene Landemore_MW 2.30-3.45_LC 103
DRST 006_03_(22271)_History & Political Thought_Demetra Kasimis_MW 9.00-10.15_LC 104
DRST 006_04_(22270)_History & Political Thought_Kathryn Slanski_TTh  2.30-3.45_WLH 007
DRST 006_05_(22276)_History & Political Thought_Charles Hill_TTh  9.00-10.15_WLH 003
DRST 006_06_(22275)_History & Political Thought_Laura Engelstein_MW 2.30-3.45_LC 209
DRST 006_07_(22274)_History & Political Thought_Paulina Espejo_TTh  9.00-10.15_LC 213".split("\n")

result = Array.new

source.each do |s|
s = s.split("_")
  print s
  abbr = s[0]
  sect_no = s[1]
  sect_id = /[0-9]+/.match(s[2]).to_s
  course = s[3]
  teacher = s[4]
  times = s[5]
  location = s[6]

  result.push([:project => "Directed Studies", :course => course, :sect_no => sect_no, :sect_id => sect_id, :teacher => teacher, :course_code => abbr])
  
end