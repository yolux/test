# encoding: utf-8
require 'pp'

doc_hash = {
#%w([社交backends]
'http://redmine.corp.ikala.tv/attachments/10433/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E7%A4%BE%E4%BA%A4_130513.docx' =>
[
%w([社交backends] user/*/last_works_of_social),
],

#%w(［通知backends］
'http://redmine.corp.ikala.tv/attachments/10436/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E7%AE%A1%E7%90%86%E4%B8%AD%E5%BF%83_%E9%80%9A%E7%9F%A5_130513.docx' =>
[
%w(［通知backends］ user/*/notification),
%w(［通知backends］ user/*/notification/listinfo),
%w(［通知backends］ user/*/notification/listinfo),
],

#%w([贊助backends］
'http://redmine.corp.ikala.tv/attachments/10429/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E8%B4%8A%E5%8A%A9_130513.docx' =>
[
%w([贊助backends］ user/*/sponsor),
%w([贊助backends］ user/*/sponsor),
],

#［PushServer backend]
'http://redmine.corp.ikala.tv/attachments/7374/PushServer%E5%BE%8C%E5%8F%B0_Chris_121108.docx' =>
[
%w(取得ProjectID ps/android/get_project_id),
%w(取得RegisterID ps/android/get_reg_ids),
%w(新增RegisterID ps/android/reg_id_add),
%w(刪除RegisterID ps/android/reg_id_delete),
%w(更新RegisterID ps/android/reg_id_update),
%w(Andorid裝置個別訊息發送 ps/android/send_msgs),
%w(Android裝置全體訊息發送 ps/android/brocast_msgs),
%w(取得Token ps/ios/get_tokens),
%w(新增裝置Token ps/ios/token_add),
%w(刪除裝置Token ps/ios/token_delete),
%w(iOS裝置訊息發送 ps/ios/send_msgs),
%w(iOS裝置全體訊息發送 ps/ios/brocast_msgs),
%w(取得訊息發送設定 ps/config_send_msgs),
%w(訊息發送設定 ps/config_send_msgs),
%w(個別訊息發送 ps/send_msgs),
%w(全體訊息發送 ps/brocast_msgs)
],

#%w(［Facebook backend］),
'http://redmine.corp.ikala.tv/attachments/10431/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_FB%E5%BE%8C%E5%8F%B0_130513.docx' =>
[
%w(［Facebookbackend］ social/fb/cancel_like),
%w(［Facebookbackend］ social/fb/get_token),
%w(［Facebookbackend］ social/fb/result_redirect),
%w(［Facebookbackend］ social/fb/share/callback),
%w([Facebookbackend] social/fb),
%w(FB分享 social/fb/share),
%w(FB按讚 social/fb/like),
%w(查詢FB計數 social/fb/query_count),
%w(新增讚與分享記錄 social/fb/add_share_recommend)
],

#%w(［使用者行為統計backends］),
'http://redmine.corp.ikala.tv/attachments/10432/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E4%BD%BF%E7%94%A8%E8%80%85%E8%A1%8C%E7%82%BA%E7%B5%B1%E8%A8%88_130513.docx' =>
[
%w(統計 statistics/by_timestamp/seen),
%w(統計某時間區間全站特定作品發表數量 statistics/by_timestamp/work),
%w(統計某時間區間全站特定作品回覆數量 statistics/by_timestamp/reply),
%w(統計某時間區間全站特定社交關係增加數量 statistics/by_timestamp/social)
],

#%w(［歡唱個人相關backend］),
'http://redmine.corp.ikala.tv/attachments/10349/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%94%B1%E6%AD%8C_%E5%80%8B%E4%BA%BA%E7%9B%B8%E9%97%9C_130508.docx' =>
[
%w(錄音集列表 user/*/my_records),
%w(點唱清單列表 user/*/song_to_sing),
%w(點唱清單新增 user/*/song_to_sing/add),
%w(點唱清單刪除 user/*/song_to_sing/delete),
%w(點唱清單插播 user/*/song_to_sing/insert)
],

#%w(［協力唱backends］),
'http://redmine.corp.ikala.tv/attachments/10343/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%94%B1%E6%AD%8C_%E5%90%88%E5%94%B1%E6%AD%8C%E6%9B%B2%E5%BE%8C%E5%8F%B0_130508.docx' =>
[
%w(［協力唱backends］ songdata/list/chorus_other_rank/listinfo),
%w(［協力唱backends］ manage_action/list/chorus_hit_rank/*),
%w(［協力唱backends］ manage_action/list/chorus_mandarin_rank/*),
%w(［協力唱backends］ manage_action/list/chorus_new_rank/*),
%w(［協力唱backends］ manage_action/list/chorus_other_rank/*),
%w(［協力唱backends］ manage_action/list/chorus_taiwanese_rank/*),
%w(新歌協力唱列表資訊 songdata/list/chorus_new_rank/listinfo),
%w(新歌協力唱列表 songdata/list/chorus_new_rank),
%w(新歌協力唱歌曲列表多曲新增 manage_action/list/chorus_new_rank/madd),
%w(新歌協力唱歌曲列表更新 manage_action/list/chorus_new_rank),
%w(新歌協力唱歌曲列表多曲刪除 manage_action/list/chorus_new_rank/mdelete),
%w(熱門協力唱列表資訊 songdata/list/chorus_hit_rank/listinfo),
%w(熱門協力唱列表 songdata/list/chorus_hit_rank),
%w(熱門協力唱歌曲列表多曲新增 manage_action/list/chorus_hit_rank/madd),
%w(熱門協力唱歌曲列表更新 manage_action/list/chorus_hit_rank),
%w(熱門協力唱歌曲列表多曲刪除 manage_action/list/chorus_hit_rank/mdelete),
%w(國語協力唱列表資訊 songdata/list/chorus_mandarin_rank/listinfo),
%w(國語協力唱列表 songdata/list/chorus_mandarin_rank),
%w(國語協力唱歌曲列表多曲新增 manage_action/list/chorus_mandarin_rank/madd),
%w(國語協力唱歌曲列表更新 manage_action/list/chorus_mandarin_rank),
%w(國語協力唱歌曲列表多曲刪除 manage_action/list/chorus_mandarin_rank/mdelete),
%w(台語協力唱列表資訊 songdata/list/chorus_taiwanese_rank/listinfo),
%w(台語協力唱列表 songdata/list/chorus_taiwanese_rank),
%w(台語協力唱歌曲列表多曲新增 manage_action/list/chorus_taiwanese_rank/madd),
%w(台語協力唱歌曲列表更新 manage_action/list/chorus_taiwanese_rank),
%w(台語協力唱歌曲列表多曲刪除 manage_action/list/chorus_taiwanese_rank/mdelete),
%w(其他協力唱列表 songdata/list/chorus_other_rank),
%w(其他協力唱歌曲列表多曲新增 manage_action/list/chorus_other_rank/madd),
%w(其他協力唱歌曲列表更新 manage_action/list/chorus_other_rank),
%w(其他協力唱歌曲列表多曲刪除 manage_action/list/chorus_other_rank/mdelete)
],

#%w(［歌手backend］),
'http://redmine.corp.ikala.tv/attachments/10341/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%94%B1%E6%AD%8C_%E6%AD%8C%E6%89%8B_130508.docx' =>
[
%w(［歌手backend］ songdata/artist/*),
%w(［歌手backend］ songdata/artist/female/phonetic/*),
%w(［歌手backend］ songdata/artist/group/phonetic/*),
%w(［歌手backend］ songdata/artist/male/phonetic/*),
%w(歌手列表資訊 songdata/artist/listinfo),
%w(歌手資訊 songdata/artist),
%w(歌手歌曲列表 songdata/artist/*/songlist),
%w(男歌手注音列表 songdata/artist/male/phonetic),
%w(男歌手單一注音列表資訊 songdata/artist/male/phonetic/*/listinfo),
%w(男歌手單一注音列表 songdata/artist/male/phonetic),
%w(女歌手注音列表 songdata/artist/female/phonetic),
%w(女歌手單一注音列表資訊 songdata/artist/female/phonetic/*/listinfo),
%w(女歌手單一注音列表 songdata/artist/female/phonetic),
%w(團體注音列表 songdata/artist/group/phonetic),
%w(團體單一注音列表資訊 songdata/artist/group/phonetic/*/listinfo),
%w(團體單一注音列表 songdata/artist/group/phonetic),
%w(熱門歌手排行列表資訊 songdata/artist/hit_rank/listinfo),
%w(熱門歌手排行列表 songdata/artist/hit_rank)
],

#%w(［歌曲backends］),
'http://redmine.corp.ikala.tv/attachments/10348/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%94%B1%E6%AD%8C_%E6%AD%8C%E6%9B%B2%E5%BE%8C%E5%8F%B0_130508.docx' =>
[
%w(［歌曲backends］ songdata/*),
%w(［歌曲backends］ manage_action/list/free/*),
%w(［歌曲backends］ manage_action/list/hit/*),
%w(［歌曲backends］ manage_action/list/hit/madd),
%w(［歌曲backends］ manage_action/list/hit/mdelete),
%w(［歌曲backends］ manage_action/list/mandarin_rank/*),
%w(［歌曲backends］ manage_action/list/new/*),
%w(［歌曲backends］ manage_action/list/other_rank/*),
%w(［歌曲backends］ manage_action/list/taiwanese_rank/*),
%w(所有歌曲列表資訊 songdata/list),
%w(歌曲資訊查詢 songdata),
%w(免費歌曲列表資訊 songdata/list/free/listinfo),
%w(免費歌曲列表 songdata/list/free),
%w(免費歌曲列表多曲新增 manage_action/list/free/madd),
%w(免費歌曲列表更新 manage_action/list/free),
%w(免費歌曲列表多曲刪除 manage_action/list/free/mdelete),
%w(新歌快報列表資訊 songdata/list/new/listinfo),
%w(新歌快報列表 songdata/list/new),
%w(新歌快報歌曲列表多曲新增 manage_action/list/new/madd),
%w(新歌快報列表更新 manage_action/list/new),
%w(新歌快報歌曲列表多曲刪除 manage_action/list/new/mdelete),
%w(熱門排行列表資訊 songdata/list/hit/listinfo),
%w(熱門排行列表 songdata/list/hit),
%w(熱門排行歌曲列表多曲新增 manage_action/list/new/madd),
%w(熱門排行歌曲列表更新 manage_action/list/new),
%w(熱門排行歌曲列表多曲刪除 manage_action/list/new/mdelete),
%w(國語排行歌曲列表資訊 songdata/list/mandarin_rank/listinfo),
%w(國語排行列表 songdata/list/mandarin_rank),
%w(國語排行歌曲列表多曲新增 manage_action/list/mandarin_rank/madd),
%w(國語排行歌曲列表更新 manage_action/list/mandarin_rank),
%w(國語排行歌曲列表多曲刪除 manage_action/list/mandarin_rank/mdelete),
%w(台語排行歌曲列表資訊 songdata/list/taiwanese_rank/listinfo),
%w(台語排行列表 songdata/list/taiwanese_rank),
%w(台語排行歌曲列表多曲新增 manage_action/list/taiwanese_rank/madd),
%w(台語排行歌曲列表更新 manage_action/list/taiwanese_rank),
%w(台語排行歌曲列表多曲刪除 manage_action/list/taiwanese_rank/mdelete),
%w(其他排行歌曲列表資訊 songdata/list/other_rank/listinfo),
%w(其他排行列表 songdata//list/other_rank),
%w(其他排行歌曲列表多曲新增 manage_action/list/other_rank/madd),
%w(其他排行歌曲列表更新 manage_action/list/other_rank),
%w(其他排行歌曲列表多曲刪除 manage_action/list/other_rank/mdelete)
],

#%w(［語言歌曲列表backend］),
'http://redmine.corp.ikala.tv/attachments/10342/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%94%B1%E6%AD%8C_%E8%AA%9E%E8%A8%80%E6%AD%8C%E6%9B%B2%E5%BE%8C%E5%8F%B0_130508.docx' =>
[
%w(［語言歌曲列表backend］ songdata/list/mandarin/phonetic/*),
%w(［語言歌曲列表backend］ songdata/list/mandarin/phonetic/listinfo),
%w(［語言歌曲列表backend］ songdata/list/mandarin/words/*),
%w(［語言歌曲列表backend］ songdata/list/other/alphabet/*),
%w(［語言歌曲列表backend］ songdata/list/other/words/*),
%w(［語言歌曲列表backend］ songdata/list/other_rank),
%w(［語言歌曲列表backend］ songdata/list/taiwanese/phonetic/*),
%w(［語言歌曲列表backend］ songdata/list/taiwanese/words/*),
%w(國語歌曲注音列表 songdata/list/mandarin/phonetic),
%w(國語歌曲單一注音列表資訊 songdata/list/mandarin/phonetic/*/listinfo),
%w(國語歌曲單一注音列表 songdata/list/mandarin/phonetic),
%w(國語歌曲字數列表資訊 songdata/list/mandarin/words/listinfo),
%w(國語歌曲字數列表 songdata/list/mandarin/words),
%w(國語歌曲單一字數列表資訊 songdata/list/mandarin/words/*/listinfo),
%w(國語歌曲單一字數列表 songdata/list/mandarin/words),
%w(台語歌曲注音列表資訊 songdata/list/taiwanese/phonetic/listinfo),
%w(台語歌曲注音列表 songdata/list/taiwanese/phonetic),
%w(台語歌曲單一注音列表資訊 songdata/list/taiwanese/phonetic/*/listinfo),
%w(台語歌曲單一注音列表 songdata/list/taiwanese/phonetic),
%w(台語歌曲字數列表資訊 songdata/list/taiwanese/words/listinfo),
%w(台語歌曲字數列表 songdata/list/taiwanese/words),
%w(台語歌曲單一字數列表資訊 songdata/list/taiwanese/words/*/listinfo),
%w(台語歌曲單一字數列表 songdata/list/taiwanese/words),
%w(其他歌曲列表資訊 songdata/list/other/listinfo),
%w(其他歌曲字數列表 songdata/list/other/words),
%w(其他歌曲單一字數列表資訊 songdata/list/other/words/*/listinfo),
%w(其他歌曲單一字數列表 songdata/list/other/words),
%w(其他歌曲字母列表 songdata/list/other/alphabet),
%w(其他歌曲單一字母列表資訊 songdata/list/other/alphabet/*/listinfo),
%w(其他歌曲單一字母列表 songdata/list/other/alphabet)
],

#%w(［愛影音backends］),
'http://redmine.corp.ikala.tv/attachments/10528/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%BD%B1%E9%9F%B3_%E5%BD%B1%E9%9F%B3%E5%BE%8C%E5%8F%B0_130520.docx' =>
[
%w(［愛影音backends］ manage_action/ksong_hit/*),
%w(［愛影音backends］ manage_action/ksong_new/*),
%w(［愛影音backends］ user/*/ivideo/*),
%w(［愛影音backends］ user/*/ivideo/*),
%w(［愛影音backends］ user/*/ksong/*),
%w(［愛影音backends］ manage_action/super_chorus/*),
%w(［愛影音backends］ manage_action/super_female/*),
%w(［愛影音backends］ manage_action/super_male/*),
%w(［愛影音backends］ manage_action/super_newbie/*),
%w(［愛影音backends］ manage_action/video_hit/*),
%w(［愛影音backends］ manage_action/video_new/*),
%w(［愛影音backends］ manage_action/week_top_hit/*),
%w(［愛影音backends］ manage_action/works_hit/*),
%w(［愛影音backends］ manage_action/works_new/*),
%w(愛影音backends user/*/ivideo),
%w(K歌作品資訊查詢 user/*/ksong),
%w(K歌作品被瀏覽次數更新 add_work_count_seen),
%w(K歌作品留言資訊 user/*/ksong/*/comment_listinfo),
%w(K歌作品留言查詢 user/*/ksong/*/comment_list),
%w(K歌作品留言新增 user/*/ksong/*/add_comment),
%w(K歌作品留言刪除 user/*/ksong/*/del_comment),
%w(影片資訊查詢 user/*/ivideo),
%w(影片作品被瀏覽次數更新 add_work_count_seen),
%w(影片作品留言資訊 user/*/ivideo/*/comment_listinfo),
%w(影片作品留言查詢 user/*/ivideo/*/comment_list),
%w(影片作品留言新增 user/*/ivideo/*/add_comment),
%w(影片作品留言刪除 user/*/ivideo/*/del_comment),
%w(影音達人列表資訊 iav/hituser/listinfo),
%w(影音達人列表 iav/hituser),
%w(影音達人列表新增 manage_action/hituser/madd),
%w(影音達人列表更新 manage_action/hituser),
%w(影音達人列表刪除 manage_action/hituser/mdelete),
%w(週間點閱影片列表資訊 iav/week_top_hit/listinfo),
%w(週間點閱影片列表 iav/week_top_hit),
%w(週間點閱影片列表新增 manage_action/week_top_hit/madd),
%w(週間點閱影片列表更新 manage_action/week_top_hit/),
%w(週間點閱影片列表刪除 manage_action/week_top_hit/mdelete),
%w(熱門K歌作品列表資訊 iav/ksong_hit/listinfo),
%w(熱門K歌作品列表 iav/ksong_hit),
%w(熱門K歌作品列表新增 manage_action/ksong_hit/madd),
%w(熱門K歌作品列表更新 manage_action/ksong_hit),
%w(熱門K歌作品列表刪除 manage_action/ksong_hit/mdelete),
%w(最新K歌作品列表資訊 iav/ksong_new/listinfo),
%w(最新K歌作品列表 iav/ksong_new),
%w(最新K歌作品列表新增 manage_action/ksong_new/madd),
%w(最新K歌作品列表更新 manage_action/ksong_new),
%w(最新K歌作品列表刪除 manage_action/ksong_new/mdelete),
%w(熱門影音作品列表資訊 iav/video_hit/listinfo),
%w(熱門影音作品列表 iav/video_hit),
%w(熱門影音作品列表新增 manage_action/video_hit/madd),
%w(熱門影音作品列表更新 manage_action/video_hit),
%w(熱門影音作品列表刪除 manage_action/video_hit/mdelete),
%w(最新影音作品列表資訊 iav/video_new/listinfo),
%w(最新影音作品列表 iav/video_new),
%w(最新影音作品列表新增 manage_action/video_new/madd),
%w(最新影音作品列表更新 manage_action/video_new),
%w(最新影音作品列表刪除 manage_action/video_new/mdelete),
%w(超級男聲作品列表資訊 iav/super_male/listinfo),
%w(超級男聲作品列表 iav/super_male),
%w(超級男聲作品列表新增 manage_action/super_male/madd),
%w(超級男聲作品列表更新 manage_action/super_male),
%w(超級男聲作品列表刪除 manage_action/super_male/mdelete),
%w(超級女聲作品列表資訊 iav/super_female/listinfo),
%w(超級女聲作品列表 iav/super_female),
%w(超級女聲作品列表新增 manage_action/super_female/madd),
%w(超級女聲作品列表更新 manage_action/super_female),
%w(超級女聲作品列表刪除 manage_action/super_female/mdelete),
%w(超級合聲作品列表資訊 iav/super_chorus/listinfo),
%w(超級合聲作品列表 iav/super_chorus),
%w(超級合聲作品列表新增 manage_action/super_chorus/madd),
%w(超級合聲作品列表更新 manage_action/super_chorus),
%w(超級合聲作品列表刪除 manage_action/super_chorus/mdelete),
%w(超級新人作品列表資訊 iav/super_newbie/listinfo),
%w(超級新人作品列表 iav/super_newbie),
%w(超級新人作品列表新增 manage_action/super_newbie/madd),
%w(超級新人作品列表更新 manage_action/super_newbie),
%w(超級新人作品列表刪除 manage_action/super_newbie/mdelete),
%w(熱門作品列表資訊 iav/works_hit/listinfo),
%w(熱門作品列表 iav/works_hit),
%w(熱門作品列表新增 manage_action/works_hit/madd),
%w(熱門作品列表更新 manage_action/works_hit),
%w(熱門作品列表刪除 manage_action/works_hit/mdelete),
%w(最新作品列表資訊 iav/works_new/listinfo),
%w(最新作品列表 iav/works_new),
%w(最新作品列表新增 manage_action/works_new/madd),
%w(最新作品列表更新 manage_action/works_new),
%w(最新作品列表刪除 manage_action/works_new/mdelete)
],

#%w(［影音管理中心］),
'http://redmine.corp.ikala.tv/attachments/10423/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E5%BD%B1%E9%9F%B3_%E5%BD%B1%E9%9F%B3%E7%AE%A1%E7%90%86%E4%B8%AD%E5%BF%83_130513.docx' =>
[
%w(［影音管理中心］ media/ivideo_file_status/*),
%w(［影音管理中心］ media/ksong_file_status/*),
%w(［影音管理中心］ ksong/chorus_all_wait_list/*),
%w(影音管理中心］ media/ivideo_file_status),
%w(影音管理中心］ media/add_ivideo),
%w(K歌／協力唱作品多首刪除 user/*/ksong/mdelete),
%w(K歌／協力唱作品多首復原 user/*/ksong/mrestore),
%w(K歌／協力唱作品新增 media/add_ksong),
%w(接唱（完成協力唱）作品新增 media/complete_chorus),
%w(K歌／協力唱／接唱作品更新 user/*/ksong),
%w(作品檔案狀態更新 media/ksong_file_status),
%w(發起協力唱 user/*/ksong/*/chorus_initiate),
%w(送出審核 user/*/ksong/*/chorus_to_publish),
%w(作品集列表資訊 user/*/work_listinfo),
%w(作品集列表 user/*/work),
%w(K歌作品列表 user/*/ksong),
%w(暫存K歌作品列表 user/*/ksong/temp_list),
%w(K歌作品發佈 user/*/ksong/*/publish),
%w(待協力唱作品列表 user/*/ksong/chorus_wait_list),
%w(待審核協力唱作品列表 user/*/ksong/chorus_wait_commit),
%w(已送出待審核協力唱作品列表 user/*/ksong/chorus_has_send),
%w(個人協力唱發起列表 user/*/ksong/chorus_invite_list),
%w(協力唱作品發佈 user/*/ksong/*/chorus_publish),
%w(站內待協力唱作品列表 ksong/chorus_all_wait_list),
%w(協力唱邀請對象列表 user/*/ksong/*/chorus_invite_users),
%w(刪除待協力唱作品列表 user/*/ksong/chorus_wait_list/*/delete),
%w(多項刪除待協力唱作品列表 user/*/ksong/chorus_wait_list/mdelete),
%w(上傳影片暫存列表 user/*/ivideo/temp_list),
%w(上傳影片已發佈列表 user/*/ivideo),
%w(上傳影片多項刪除 user/*/ivideo/mdelete),
%w(上傳影片新增 user/*/ivideo),
%w(上傳影片更新 user/*/ivideo),
%w(上傳影片檔案狀態更新 media/ksong_file_status),
%w(上傳影片發佈 user/*/ivideo/*/publish)
],


#%w(［K歌動態backends］),
'http://redmine.corp.ikala.tv/attachments/10425/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E9%A0%BB%E9%81%93_K%E6%AD%8C%E5%8B%95%E6%85%8B_130513.docx' =>
[
%w(［K歌動態backends］ user/*/user_flow_comment/*),
%w(［K歌動態backends］ user/*/user_flow_comment/*),
%w(［K歌動態backends］ user/*/ksong_status/*/report),
%w(［K歌動態backends］ user/*/ksong_status/*/share),
%w(［K歌動態backends］ user/*/ksong_status/*/user_invisible),
%w(［K歌動態backends］ user/*/ksong_status/listinfo),
%w(［K歌動態backends］ user/*/user_flow/*),
%w(K歌動態列表 user/*/ksong_status),
%w(K歌動態列表刪除 user/*/ksong_status/mdelete),
%w(K歌動態純文字留言資訊 user/*/user_flow),
%w(K歌動態純文字留言新增 user/*/user_flow),
%w(K歌動態純文字留言刪除 user/*/user_flow/mdelete),
%w(K歌動態純文字留言Reply列表 user/*/user_flow_comment),
%w(K歌動態純文字留言Reply新增 user/*/user_flow_comment),
%w(K歌動態純文字留言Reply刪除 user/*/user_flow_comment/*/mdelete)
],

#%w(［主頁面backends］),
'http://redmine.corp.ikala.tv/attachments/10465/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E9%A0%BB%E9%81%93_%E4%B8%BB%E9%A0%81%E9%9D%A2_130516.docx' =>
[
%w(［主頁面backends］ ichannel/recommend/*),
%w(［主頁面backends］ ichannel/recommend/*),
%w(［主頁面backends］ ichannel/recommend/*/*),
%w(［主頁面backends］ ichannel/recommend/*/*),
%w(［主頁面backends］ ichannel/recommend/*/listinfo),
%w(主頁面backends ichannel/recommend),
%w(個人頻道資訊 user/*/chinfo),
%w(個人頻道被瀏覽次數更新 add_work_count_seen),
%w(個人頻道圖集 user/*/channel_icon_set),
%w(更新主頁面六張代表性照片 user/*/profile_photo_list),
%w(線上動態資訊 ichannel/linestatus/listinfo),
%w(線上動態列表 ichannel/linestatus),
%w(熱門頻道列表資訊 ichannel/hit_channel_list/listinfo),
%w(熱門頻道列表 ichannel/hit_channel_list),
%w(熱門頻道列表自動產生 ichannel/hit_channel_list/auto_gen),
%w(熱門頻道列表新增 ichannel/hit_channel),
%w(熱門頻道列表更新 ichannel/hit_channel),
%w(熱門頻道列表刪除 ichannel/hit_channel/mdelete),
%w(新人報到列表資訊 ichannel/newbies/listinfo),
%w(新人報到列表 ichannel/newbies)
],

#%w(［專輯backends］),
'http://redmine.corp.ikala.tv/attachments/10428/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E9%A0%BB%E9%81%93_%E5%B0%88%E8%BC%AF_130513.docx' =>
[
%w(［專輯backends］ user/*/song_album/collection),
%w(［專輯backends］ user/*/song_album_comment/*),
%w(［專輯backends］ user/*/song_album_comment/*),
%w(［專輯backends］ user/*/song_album/*),
%w(［專輯backends］ user/*/song_album/*),
%w(［專輯backends］ user/*/song_album/*),
%w(［專輯backends］ user/*/idol_song_album),
%w(［專輯backends］ user/*/song_album_comment/*/mdelete),
%w(個人製作專輯列表資訊 user/*/song_album/personal/listinfo),
%w(個人製作專輯列表 user/*/song_album/personal),
%w(個人收藏專輯列表資訊 user/*/song_album/collection/listinfo),
%w(個人收藏專輯列表 user/*/*/song_album/collection),
%w(個人收藏專輯新增 user/*/song_album/collection/madd),
%w(個人收藏專輯刪除 user/*/song_album/collection/mdelete),
%w(好友專輯列表資訊 user/*/friend_song_album/listinfo),
%w(好友專輯列表 user/*/*/friend_song_album),
%w(偶像專輯列表資訊 user/*/idol_song_album/listinfo),
%w(偶像專輯列表 user/*/*/idol_song_album),
%w(熱門專輯列表 ichannel/song_album/hit_album_list),
%w(熱門專輯新增 ichannel/song_album/hit_song_album),
%w(熱門專輯更新 ichannel/song_album/hit_song_album),
%w(熱門專輯多項刪除  ichannel/song_album/hit_song_album/mdelete),
%w(熱門偶像專輯列表資訊 ichannel/song_album/hit_idol_album_list/listinfo),
%w(熱門偶像專輯列表 ichannel/song_album/hit_idol_album_list),
%w(專輯內容資訊 user/*/song_album),
%w(專輯被瀏覽次數更新 add_work_count_seen),
%w(專輯歌曲列表資訊 user/*/song_album/*/listinfo),
%w(專輯歌曲列表 user/*/song_album/*/song_list),
%w(專輯歌曲單首新增 user/*/song_album/*/song_list),
%w(專輯歌曲多首新增 user/*/song_album/*/song_list/madd),
%w(專輯歌曲多首刪除 user/*/song_album/*/song_list/mdelete),
%w(專輯新增 user/*/song_album),
%w(專輯單項刪除 user/*/song_album),
%w(專輯多項刪除 user/*/song_album/mdelete),
%w(專輯更新 user/*/song_album),
%w(專輯檢舉 user/*/song_album/*/report),
%w(專輯留言列表資訊 user/*/song_album_comment/*/listinfo),
%w(專輯留言列表 user/*/song_album_comment),
%w(專輯留言新增 user/*/song_album_comment),
%w(專輯留言刪除 user/*/song_album_comment)
],

#%w(［相簿backends］),
'http://redmine.corp.ikala.tv/attachments/10427/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E9%A0%BB%E9%81%93_%E7%9B%B8%E7%B0%BF_130513.docx' =>
[
%w(［相簿backends］ user/*/photo_album_comment/*/mdelete),
%w(［相簿backends］ user/*/photo_album/*),
%w(［相簿backends］ user/*/photo_album/*),
%w(［相簿backends］ user/*/photo_album/*/photo_list/*),
%w(［相簿backends］ user/*/photo_album/*/photo_simple_list),
%w(［相簿backends］ user/*/photo_album_comment/*),
%w(［相簿backends］ user/*/photo_album_comment/*),
%w(［相簿backends］ photo_information/*),
%w(個人相簿列表資訊 user/*/photo_album/listinfo),
%w(個人相簿列表 user/*/photo_album),
%w(熱門相簿列表 ichannel/photo_album/hit_album_list),
%w(熱門相簿新增 ichannel/photo_album/hit_photo_album),
%w(熱門相簿更新 ichannel/photo_album/hit_photo_album),
%w(熱門相簿多項刪除 ichannel/photo_album/hit_photo_album/mdelete),
%w(相簿內容資訊 user/*/photo_album),
%w(相簿被瀏覽次數更新 add_work_count_seen),
%w(相簿照片列表資訊 user/*/photo_album/*/listinfo),
%w(照片資訊查詢 photo_information),
%w(相簿照片列表 user/*/photo_album/*/photo_list),
%w(相簿照片多張新增 user/*/photo_album/*/photo_list/madd),
%w(相簿照片多項刪除 user/*/photo_album/*/photo_list/mdelete),
%w(相簿照片更新 user/*/photo_album/*/photo_list),
%w(相簿新增 user/*/photo_album),
%w(相簿多項刪除 user/*/photo_album/mdelete),
%w(相簿更新 user/*/photo_album),
%w(相簿留言列表資訊 user/*/photo_album_comment/*/listinfo),
%w(相簿留言列表 user/*/photo_album_comment),
%w(相簿留言新增 user/*/photo_album_comment),
%w(相簿留言刪除 user/*/ photo_album_comment/*/mdelete)
],

#%w(［關於我backends］),
'http://redmine.corp.ikala.tv/attachments/10424/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%84%9B%E9%A0%BB%E9%81%93_%E9%97%9C%E6%96%BC%E6%88%91_130513.docx' =>
[
%w(［關於我backends］ user/*/relation/*/common_friend),
%w(［關於我backends］ user/*/relation/*/common_friend/listinfo),
%w(［關於我backends］ user/*/relation/*/common_idol),
%w(［關於我backends］ user/*/relation/*/common_idol/listinfo),
%w(［關於我backends］ user/*/relation/*/common_songbook),
%w(［關於我backends］ user/*/relation/*/common_songbook/listinfo),
%w(［關於我backends］ user/*/relation),
%w(［關於我backends］ user/*/relation),
%w(［關於我backends］ user/*/relation/*/list),
%w(［關於我backends］ user/*/relation/*/listinfo),
%w(［關於我backends］ user/*/browsed),
%w(基本資料查詢 user/*/profile),
%w(基本資料新增 user/*/profile),
%w(基本資料更新 user/*/profile),
%w(基本資料隱藏／顯示查詢 user/*/profile/visible),
%w(基本資料隱藏／顯示設定 user/*/profile/visible),
%w(會員隱私權查詢 user/*/profile/privacy_setting),
%w(會員隱私權設定 user/*/profile/privacy_setting),
%w(好友列表資訊 user/*/relation/Friend/listinfo),
%w(好友列表 user/*/relation/Friend/list),
%w(好友加入請求 user/*/add_relation),
%w(好友新增 user/*/add_relation),
%w(拒絕好友加入請求 user/*/break_relation),
%w(好友刪除 user/*/break_relation),
%w(偶像列表資訊 user/*/relation/Idol/listinfo),
%w(偶像列表 user/*/relation/Idol/list),
%w(偶像新增 user/*/add_relation),
%w(偶像刪除 user/*/break_relation),
%w(粉絲列表資訊 user/*/relation/Fans/listinfo),
%w(粉絲列表 user/*/relation/Fans/list),
%w(粉絲新增 user/*/add_relation),
%w(粉絲刪除 user/*/break_relation),
%w(黑名單列表資訊 user/*/relation/Block/listinfo),
%w(黑名單列表 user/*/relation/Block/list),
%w(黑名單新增 user/*/add_relation),
%w(黑名單刪除 user/*/break_relation),
%w(被瀏覽列表資訊 user/*/browsed/listinfo),
%w(被瀏覽列表 user/*/user/browsed)
],

#%w(［搜尋backends］),
'http://redmine.corp.ikala.tv/attachments/10430/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E6%90%9C%E5%B0%8B_130513.docx' =>
[
%w(自動完成字串搜尋 search/word_autocomp),
%w(整體搜尋 search),
%w(歌曲搜尋 search/songs),
%w(歌手搜尋 search/artists),
%w(會員搜尋 search/members),
%w(影音作品搜尋 search/works)
],

#%w(［第0頁backends］),
'http://redmine.corp.ikala.tv/attachments/10434/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E7%AC%AC0%E9%A0%81_130513.docx' =>
[
%w(查詢歌曲已唱會員列表 recommend_song/*/member_sang_list),
%w(查詢歌曲已唱K歌作品列表 songdata/*/song_ksong_list),
%w(查詢mobile上傳K歌作品列表 ichannel/mobile_upload_ksong/list),
%w(查詢有使用特效的K歌作品列表 ichannel/special_effect_ksong/list),
%w(查詢所有K歌作品列表 ichannel/ksong_all/list)
],

#%w(［訊息backends］),
'http://redmine.corp.ikala.tv/attachments/10435/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E7%AE%A1%E7%90%86%E4%B8%AD%E5%BF%83_%E8%A8%8A%E6%81%AF_130513%20.docx' =>
[
%w(［訊息backends］ conversation/*),
%w(［訊息backends］ conversation/*),
%w(［訊息backends］ conversation/*),
%w(［訊息backends］ conversation/*),
%w(［訊息backends］ conversation/with/*),
%w(對話訊息列表資訊 user/*/conversation/listinfo),
%w(對話訊息列表 user/*/conversation),
%w(已讀取訊息 conversation),
%w(特定對像對話訊息 conversation/with),
%w(對話內容列表資訊 conversation/*/listinfo),
%w(對話內容列表 conversation),
%w(對話訊息新增 conversation),
%w(對話訊息回覆 conversation),
%w(對話訊息刪除 conversation)
],

#%w(［自動排行榜 backend］),
'http://redmine.corp.ikala.tv/attachments/10607/%E5%80%8B%E5%88%A5%E9%A0%85%E7%9B%AE_%E8%87%AA%E5%8B%95%E6%8E%92%E8%A1%8C%E6%A6%9C_130531.docx' =>
[
%w(熱門K歌自動排行 autoranking/ksong_hit),
%w(熱門影音自動排行 autoranking/video_hit),
%w(超級男聲自動排行 autoranking/super_male),
%w(超級女聲自動排行 autoranking/super_female),
%w(超級合聲自動排行 autoranking/super_chorus),
%w(超級新人自動排行 autoranking/super_newbie),
%w(熱門作品自動排行 autoranking/work_hit),
%w(熱門相簿自動排行 autoranking/hit_photo_album),
%w(熱門頻道自動排行 autoranking/hit_channel)
],
}

# input data
log_folder = 'log'
output_folder = 'output'
reference_folder = 'output/page'
log_files = Dir.glob("#{log_folder}/*/*") 
#log_files = Dir.glob("#{log_folder}/**/*") 
#log_files = Dir.glob("#{log_folder}/**/*/") 

p 'check folders'
for x in [log_folder, output_folder, reference_folder]
  raise "Folder '#{x}'' Not Found" unless File.exist? x
end

# parse route table
p 'parse route table'
route_table = []
File.open('../config/routes.rb', 'r') do |f| 
  f.readlines.each do |line|
  	if line =~ /^\s*(post|get|put|delete)\s+/
  	  x = line.strip.gsub("'", '').gsub('=>', '').split(' ')
  	  y1, y2 = x[2].split('#')
  	  # route_table list item attribute is [ method, api, rb file name, func name]
  	  route_table << [x[0], x[1], y1, y2 ]
  	end
  end 
end
route_table.sort!

# parse thrift table
p 'parse thrift table'
thrift_table = []
File.open('./RunL1ApiService.sh', 'r') do |f| 
  f.readlines.each do |line|
  	(thrift_table << line.strip.gsub('Api1','').split(' ')[1]) if line =~ /^\/home\/social/
  end 
end
thrift_table.sort!

# parse cfunc_call_thrift_table
p 'parse cfunc_call_thrift_table'
cfunc_call_thrift_table = {}
cfunc_call_thrift_table_ex = {}
Dir.glob('../app/controllers/**/*').each do |item|
  next if File.directory? item
  File.open(item, 'r') do |f|
    controller_name = File.basename(item).gsub('_controller.rb', '')
    p " -> #{controller_name}"

    cur_func_name = nil
    key = "#{controller_name}\##{cur_func_name}"
    #cfunc_call_thrift_table[key] = []
    cfunc_call_thrift_table_ex[controller_name] = []

  	f.readlines.each do |line|
  	  next if line =~ /^\s*#/
  	  if line =~ /\s*class (\w+)\(?/
  	    cur_func_name = $1
  	    key = "#{controller_name}\##{cur_func_name}"
        cfunc_call_thrift_table[key] = []	
  	  elsif line =~ /\s*def (\w+)\(?/
  	    cur_func_name = $1
  	    key = "#{controller_name}\##{cur_func_name}"
        cfunc_call_thrift_table[key] = []
  	  else
  	  	unless cur_func_name.nil?
  	  	  thrifts = thrift_table.select{|x| Regexp.new("#{x}") =~ line}
  	  	  cfunc_call_thrift_table[key].concat thrifts
  	  	  cfunc_call_thrift_table_ex[controller_name].concat thrifts
  	  	end
  	  end
  	end # readlines

  end
end
#pp cfunc_call_thrift_table
#pp cfunc_call_thrift_table_ex
#p '-'*50

# replace empty array by default array
p 'replace empty array by default array'
cfunc_call_thrift_table.each_pair do |k,v|
  cfunc_call_thrift_table[k] = cfunc_call_thrift_table_ex[k.split('#')[0]] if v.empty?
end
#pp cfunc_call_thrift_table

# parse thrift call L1 table
p 'parse thrift_call_l1_table'
thrift_call_l1_table = {}
thrift_table.each do |thrift_name|
  File.open("#{reference_folder}/#{thrift_name}.html", 'r') do |f|
    func_string = f.readlines[2]
    p " -> #{thrift_name} can not found func" if func_string.empty?
    s = func_string.strip.gsub(',','').gsub(/\d+./,'').split('<br>')
    thrift_call_l1_table[thrift_name] = s
  end
end

tmp = []
cache_file = "#{output_folder}/cache"
#tmp = File.exist?(cache_file) ? Marshal.load(File.read(cache_file)) : []
match_count = 0
unmatch_count = 0
doc_missing = 0

# parse api from log file
p 'parse api from log file'
if tmp.empty?
  request_method = [['"PUT /','put'], ['"DELETE /','delete'], ['"GET /', 'get'], ['"POST /', 'post']]
  log_files.each do |log_file|
  	next if File.directory? log_file
  	p "read log file: #{log_file}"
    File.open(log_file, 'r') do |f| 
      f.readlines.each do |line|
        request_method.each do |pattern, method|
          api = line.strip.split(pattern)[1]
          next if api.nil?
          tmp << [api.gsub(/\d+[_\d]*/, '*'), method]
        end
      end    end
    p "current total apis :#{tmp.size}"
  end

  p 'remove duplicate'
  tmp.uniq!
  p tmp.size
  #File.open(cache_file, 'w') {|f| f.write(Marshal.dump(tmp)) }
end

# find out the L2 api which is used in log file
p 'find match in L2 routing table'
output = []
route_table.each do |method, api, group, func|
  formatted_api = api.gsub(/:\w+/,'*')

  if tmp.any?{ |api2, method2| (formatted_api == api2) and (method == method2)}
    output << [api, group, '1', method, func, formatted_api]
    match_count = match_count+1
  else
    output << [api, group, '0', method, func, formatted_api]
    unmatch_count = unmatch_count+1
  end
end

# add doc link
p 'append document link for each api'
p 'missing link here:'
tmp = []
output.each do |api, group, match, method, func, formatted_api|
  doc_link = ''
  doc_title = '?'

  doc_hash.each_pair do |doc, api_list|
    api_list.each do |desc, doc_api|
      if formatted_api == doc_api
        doc_link = doc
        doc_title = desc
        break
      end
    end
    break unless doc_link.empty?
  end

  tmp << [api, group, match, method, func, formatted_api, doc_link, doc_title]

  if doc_link.empty?
    p " -> #{[api, group, match, method, func, formatted_api, doc_link, doc_title]}"
    doc_missing = doc_missing +1
  end
end

# sorting & grouping
p 'sorting & grouping'
output = {}
tmp.sort do |a,b|
  a.join('') <=> b.join('')
end.group_by do |x|
  x[1]
end.each_pair do |k,v|
  api_match_count = v.count{|x| x[2] == '1'}
  total_count = v.size
  percentage = api_match_count*100.0/total_count
  text = "+#{k} (#{api_match_count}/#{total_count} => #{"%.2f" % [percentage]}%)"
  key = percentage+v.size/100.0

  output[key] = [text, v]
end

# generate html file
p 'generate html file: SBE_L2_API_usage_report.html'
# thrift used 
thrift_usage_list = []
File.open("#{output_folder}/SBE_L2_API_usage_report.html", 'w') do |f|
  tmp = {}
  f.write '<html><head>'
  f.write '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
  f.write '<style type="text/css">'
  f.write 'body'
  f.write '{'
  f.write 'font-family:courier, "courier new", monospace;'
  f.write 'font-size:1em;'
  f.write 'color:#0000FF;'
  f.write 'background-color:#f0f0f0;'
  f.write '}'
  f.write '</style></head><body>'
  f.write "<p>match access log api count = #{match_count}</p>"
  f.write "<p>unmatch access log api count = #{unmatch_count}</p>"
  f.write "<p>unmatch doc link api count = #{doc_missing}</p>"
  p 'function with mistake:'
  output.sort.reverse.each do |k,v|
    title, info = v
    f.write "<br><h1>#{title}</h1><br>"
    info.each do |api, group, match, method, func, formatted_api, doc_link, doc_title|
      method = {'get' => '___get', 'put' => '___put', 'post' => '__post', 'delete' => 'delete'}[method]
      f.write("<font color='\#B57419'>") if match == '0'
      f.write("<b>#{method} #{api} => #{func} ")
      f.write(" <a href='#{doc_link}'>[#{doc_title}]</a></b>")
      f.write("<br>")
      # 
      key = "#{group}\##{func}"
      p " -> function not in routing table: #{key}" if cfunc_call_thrift_table[key].nil?
      p " -> function didn't call thrift: #{key}" if (not cfunc_call_thrift_table[key].nil?) and cfunc_call_thrift_table[key].empty?
      #
      t = (cfunc_call_thrift_table[key] || [])
      thrift_usage_list.concat t
      f.write("thrift calls (#{t.size}) => #{t.join(', ')}")
      f.write("</font>") if match == '0'
      f.write("<br>")
    end
  end
  f.write '</body></html>'
end

# sorting & grouping
p 'sorting & grouping'
thrift_usage_list.uniq!
output = []
thrift_call_l1_table.sort.each do |thrift_name, l1_funcs|
  if thrift_usage_list.any?{|x| x == thrift_name}
    output << [true, thrift_name, l1_funcs]
  else
    output << [false, thrift_name, l1_funcs]
  end
end

# generate html file
p 'generate html file: SBE_Thrift_API_usage_report.html'
File.open("#{output_folder}/SBE_Thrift_API_usage_report.html", 'w') do |f|
  tmp = {}
  f.write '<html><head>'
  f.write '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
  f.write '<style type="text/css">'
  f.write 'body'
  f.write '{'
  f.write 'font-family:courier, "courier new", monospace;'
  f.write 'font-size:1em;'
  f.write 'color:#0000FF;'
  f.write 'background-color:#f0f0f0;'
  f.write '}'
  f.write '</style></head><body>'
  f.write "<p>match access log api count = #{output.count{|x| x[0]}}</p>"
  f.write "<p>unmatch access log api count = #{output.count{|x| not x[0]}}</p>"
  tmp = []
  output.each do |match, thrift_name, l1_funcs|
  	f.write("<font color='\#B57419'>") unless match
    f.write "<br><h1>#{thrift_name} with #{l1_funcs.size} L1 func calls</h1><br>"
    f.write("#{l1_funcs.join(', ')}")
    f.write("</font>") unless match
    f.write("<br>")
    tmp.concat(l1_funcs).uniq! if match
  end
  l1_use = tmp.size
  tmp = []
  thrift_call_l1_table.each{|k,v| tmp.concat(v).uniq!}
  l1_all = tmp.size
  percentage = l1_use*100.0/l1_all
  f.write "<br><br><br><h1>L1 func call usage is #{l1_use}/#{l1_all}( #{"%.2f" % [percentage]}%))</h1><br>"
  f.write '</body></html>'
end
