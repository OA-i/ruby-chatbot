require "open-uri"


system("clear")

def menu_screen()
  print """
  (1) Chatting
  (2) Pengaturan
  (3) Tentang """
  
  print "\n\n  Pilih Menu : "
  menu = gets.chomp
  
  if(menu == "1")
    system("clear")
    chat_screen()
    
  elsif(menu == "2")
    system("clear")
    setting_screen()
    
  elsif(menu == "3")
    system("clear")
    about_screen()
    
  else
    system("clear")
    print "\n  Menu Tidak Ada"
    sleep(1.0)
    system("clear")
    menu_screen()
  end
end


#Pengaturan
def setting_screen()
    print """ 
  (1) Kembali
  (2) Ganti Nama """
  
  print "\n\n  Pilih Menu : "
  pilih = gets.chomp
  
  if(pilih == "1")
    system("clear")
    menu_screen()
    
  elsif(pilih == "2")
    print "\n  Masukkan Nama Baru : "
    nama = gets.chomp
    system("rm -rf /sdcard/.chatbotOAi")
    system("mkdir /sdcard/.chatbotOAi")
    system("touch /sdcard/.chatbotOAi/nama.txt")
    file = open("/sdcard/.chatbotOAi/nama.txt", "w")
    file.write(nama)
    file.close()
    print "\n  Nama Berhasil Diubah"
    sleep(1.0)
    system("clear")
    setting_screen()
    
  else
    system("clear")
    print "\n  Menu Tidak Ada"
    sleep(1.0)
    system("clear")
    setting_screen()
  end
end


#Tentang
def about_screen()
    print """ 
  (1) Kembali
  
  [ By OAi ]
  
  (2) Facebook = OAi
  (3) Github = OA-i
  """
    print "\n  Pilih Menu : "
    pilih = gets.chomp
    
    if(pilih == "1")
      system("clear")
      menu_screen()
      
    elsif(pilih == "2")
      system("clear")
      facebook= URI.parse("https://m.facebook.com/profile.php?id=100033678670273")
      facebook.open{
        |f| r.read
      }
      about_screen()
      
    elsif(pilih == "3")
      system("clear")
      github = URI.parse("https://github.com/OA-i")
      github.open{
        |f| f.read
      }
      about_screen()
      
    else
      system("clear")
      print("\n  Menu Tidak Ada")
      sleep(1.0)
      system("clear")
      about_screen()
    end
end


#Chat
def chat_screen()
  filenama = "/sdcard/.chatbotOAi/nama.txt"
  nama = ""
  
  adafile = File.file?(filenama)
  if(adafile)
    line_num = 0
    carifile = File.open("/sdcard/.chatbotOAi/nama.txt").read
    carifile.gsub!(/\r\n?/, "\n")
    carifile.each_line do |line|
    nama = line
    end
  else
    print "\n  Masukkan Nama : "
    nama = gets.chomp
    system("rm -rf /sdcard/.chatbotOAi")
    system("mkdir /sdcard/.chatbotOAi")
    system("touch /sdcard/.chatbotOAi/nama.txt")
    file = open("/sdcard/.chatbotOAi/nama.txt", "w")
    file.write(nama)
    file.close()
    system("clear")
  end
  
  help =  "Halo, Hai, Pantun, Kamu Lagi Apa, Lagi apa, Siapa namaku, Siapa namamu, Apa kabar"
  pantun = [
            """Ada jahe ada kencur
        Semua dicampur jadilah bumbu
        Beberapa hari ini aku susah tidur
        Karena selalu ingat dirimu""",
            
            """Beribu-ribu pohon beringin
        Hanya satu di pohon randu
        Saat malam terasa dingin
        Hanya wajahmu yang aku rindu""",
            
            """Jalan-jalan ke kebun
        Membeli buah nangka dan jambu
        Tak peduli dalam situasi apapun
        Saya tetap akan menemanimu"""].sample
  lagiapa = ["Lagi duduk", "Lagi nugas :(", "Lagi makan", "Lagi eek hehe"].sample
  ketawa = ["Haha", "Wkwkwk", "Hehe"].sample
  
  puts "\n  Halo " + nama + " Selamat Datang Di Chat Bot " + "\n  Ketik !Help Untuk Bantuan, Ketik Kembali Untuk Kembali"

  $jawaban = {
    "p" => "Dilarang p",
    "halo" => "Halo juga " + nama,
    "hai" => "Hai juga " + nama,
    "siapa namamu" => "Namaku Bot",
    "siapa namaku" => "Nama Kamu " + nama,
    "apa kabar" => "Alhamdulilah sehat",
    "pantun" => pantun,
    "!help" => help,
    "kamu lagi apa" => lagiapa,
    "lagi apa" => lagiapa,
    "makan yang banyak ya" => "Udah kenyang",
    "semangat" => "Oke :)",
    "bau" => "Hoek",
    "iri" => "Bilang bos hahay bal bale bal bale",
    "stress" => "Gws",
    "oke" => "sip",
    "ketawa" => ketawa,
    "haha" => "Cie ketawa",
    "wkwkwk" => "Cie ketawa",
    "xixixi" => "Cie ketawa",
    "hehe" => "Cie Ketawa"
  }
  tanya()
end

def tanya()
  print "\n  Ketik Pesan : "
  pertanyaan = gets.chomp.downcase
  if($jawaban.has_key?(pertanyaan))
    puts "\n  Bot : " + $jawaban[pertanyaan]
    tanya()
    
  elsif(pertanyaan == "kembali")
    puts "\n  Bot : Bye bye"
    sleep(0.7)
    system("clear")
    menu_screen()
    
  else
    puts "\n  Bot : Saya tidak mengerti"
    tanya()
  end
end

menu_screen()