# encoding: utf-8

require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class SoundcloudTest < Minitest::Test
  def test_transform_url_with_www
    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http://www.soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_without_www
    result = auto_html('http://soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http://soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_without_protocol
    result = auto_html('soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http://soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_with_ssl
    result = auto_html('https://soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https://soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_with_options
    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud(:width => '50%', :height => '100', :auto_play => true, :show_comments => true) }    
    assert_equal '<iframe width="50%" height="100" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http://www.soundcloud.com/forss/flickermood&show_artwork=false&show_comments=true&auto_play=true&color=915f33&theme_color=00FF00"></iframe>', result
  end


  def test_can_handle_urls_in_html_1
    txt = %Q{ 
      http://blog.nu-soulmag.com/wp-content/uploads/2014/02/013-520x245.jpg\n<p>WATCH: Wedding Bells - http://youtu.be/HM04bKL4oq4</p>\n<p>Director - <strong>Peter Marsden</strong> \nProducer - <strong>Christina Kernohan</strong> \nStylist - <strong>Eclair Fifi</strong> \nFull Credits Within Film</p>\n<p>LISTEN: "Wedding Bells" (Zane Lowe BBC Radio 1 debut) - https://soundcloud.com/cashmerecat/wedding_bells</p>\n<p><strong>LuckyMe</strong> are proud to present: Wedding Bells; Cashmere Cat's attempt at a perfect thing in an imperfect world.</p>\n<p>soundcloud.com/cashmerecat https://twitter.com/CASHMERECAT https://www.facebook.com/cashmerecatofficial‎</p>
    }
    assert_silent do
      result = auto_html(txt) { soundcloud }
    end
  end

  def test_can_handle_urls_in_html_2
    txt = %Q{
    http://www.deepbeep.com.br/wp-content/uploads/2014/02/duck-sauce.jpg\n<p>A-Track e Van Helden: big as the world</p>\n<p>Já se vão quase 3 anos de “Barbra Streisand”, o hit-meme da dupla <strong>Duck Sauce</strong> aka Van Helden & A-Trak. E a boa notícia é que a discografia desses patos talentosos da música eletrônica bem-humorada segue abastecida, agora com um momento mais glamouroso e maduro, o EP “Duck Droppings”, que saiu agora em 2014.<span></span></p>\n<p>De download gratuito, para abastecer sem milongas o case alheio, esses <em>droppings</em> novos da dupla americana já haviam aparecido em seus sets e são um bom trabalho de transformar samples loopados de disco e música negra em house music acelerada (128 BPM), com um ar <em>french touch</em> saudoso que lembra rádios FMs do fim dos anos 90.</p>\n<p>Falando em FM, “Louie The First” sampleia a clássica “Brother Louie”, do Hot Chocolate, clássico de rádios animadas mundo afora. “Mondo” é nosso destaque do EP, com sua guitarra suingada correndo junto do beat e mais sample disco. </p>\n<p>Em outras notícias, A-Trak também sacou beats para o rapper veterano Cam’ron. É o EP “Federal Reserve”, ainda sem audição completa, mas com uma maravilhosa artwork de grafite que lembra o estilo paulistano e faixa boa onda “Humprey” – ouça aqui.</p>\n<p> </p>\n<p>soundcloud.com/ducksaucenyc  quackisback.com</p>
    }
    assert_silent do
      result = auto_html(txt) { soundcloud }
    end
  end


end