from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name='home'),
    path('live-auctions-list', views.live_auctions_list, name='live-auctions-list'),
    path('about/', views.about, name='about'),
    path('blog', views.blog, name='blog'),
    path('blog-details', views.blog_details, name='blog-details'),
    path('contact/', views.contact, name='contact'),
    path('category/<str:slug>', views.category, name='category'),
<<<<<<< HEAD
    
=======
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    path('msg-inbox/', views.inbox, name='msg-inbox'),

    path('shop/', views.shop, name='shop'),
    path('store-listing/', views.store_listing, name='store_listing'),
    path('blog-grid/', views.blog_grid, name='blog_grid'),
    path('blog-standard/', views.blog_standard, name='blog_standard'),
    path('blog-standard_1/', views.blog_standard1, name='blog_standard1'),
    path('accessories/', views.accessories, name='accessories'),
    path('antiques/', views.antiques, name='antiques'),
    path('cars/', views.cars, name='cars'),
    path('electronics/', views.electronics, name='electronics'),
    path('fashion/', views.fashion, name='fashion'),
    path('music/', views.music, name='music'),
    path('trading-card/', views.trading_card, name='trading_card'),
    path('vehicles/', views.vehicles, name='vehicles'),
    path('virtual-worlds/', views.virtual_worlds, name='virtual_worlds'),
    path('how-it-works/', views.how_it_works, name='how_it_works'),
    path('watches/', views.watches, name='watches'),
    path('alarm-clock-1990s/', views.alarm_clock_1990s, name='alarm_clock_1990s'),
    path('black-analogue-watch/', views.black_analogue_watch, name='black_analogue_watch'),
    path('brand-new-honda-cbr-600-special-sale-2022/', views.brand_new_honda_cbr_600_special_sale_2022,
         name='brand_new_honda_cbr_600_special_sale_2022'),
    path('creative-fashion-ribbon-digital-sun-class-s22/', views.creative_fashion_ribbon_digital_sun_class_s22,
         name='creative_fashion_ribbon_digital_sun_class_s22'),
    path('ford-shelby-white-car/', views.ford_shelby_white_car, name='ford_shelby_white_car'),
    path('havit-hv-g61-usb-black-double-game-vibrat/', views.havit_hv_g61_usb_black_double_game_vibrat,
         name='havit_hv_g61_usb_black_double_game_vibrat'),
    path('iphone-11-pro-max-available-for-special-sale/', views.iphone_11_pro_max_available_for_special_sale,
         name='iphone_11_pro_max_available_for_special_sale'),
    path('leather-digital-watch/', views.leather_digital_watch, name='leather_digital_watch'),
    path('macbook-pro-2018/', views.macbook_pro_2018, name='macbook_pro_2018'),
    path('premium-1998-typewriter/', views.premium_1998_typewriter, name='premium_1998_typewriter'),
    path('red-color-special-lighter-2-2-for-saleing-offer/', views.red_color_special_lighter_2_2_for_saleing_offer,
         name='red_color_special_lighter_2_2_for_saleing_offer'),
    path('stylish-digital-airpods/', views.stylish_digital_airpods, name='stylish_digital_airpods'),
    path('toyota-aigid-a-class-hatchback-2017-2021/', views.toyota_aigid_a_class_hatchback_2017_2021,
         name='toyota_aigid_a_class_hatchback_2017_2021'),
    path('wedding-couple-ring/', views.wedding_couple_ring, name='wedding_couple_ring'),
    path('a-brand-for-a-company-is-like-for-a-person/', views.a_brand_for_a_company_is_like_for_a_person,
         name='a_brand_for_a_company_is_like_for_a_person'),
    path('faq/', views.faq, name='faq'),
    path('404/', views.not_found, name='not_found'),
    path('wishlist/', views.wishlist, name='wishlist'),
    path('david-droga-still-has-faith-in-online-creative-copy-copy/',
         views.david_droga_still_has_faith_in_online_creative_copy_copy,
         name='david_droga_still_has_faith_in_online_creative_copy_copy'),
    path('david-droga-still-has-faith-in-online-creative-copy/',
         views.david_droga_still_has_faith_in_online_creative_copy,
         name='david_droga_still_has_faith_in_online_creative_copy'),
    path('david-droga-still-has-faith-in-online-creative/', views.david_droga_still_has_faith_in_online_creative,
         name='david_droga_still_has_faith_in_online_creative'),
    path('a-brand-for-a-company-is-like-for-a-person/', views.a_brand_for_a_company_is_like_for_a_person,
         name='a_brand_for_a_company_is_like_for_a_person'),
    path('10-auctionivity-strategies-backed-by-science/', views.auctionivity_strategies_backed_by_science,
         name='auctionivity_strategies_backed_by_science'),
    path('lost-password/', views.lost_password, name='lost_password'),



]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
