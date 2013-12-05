# encoding: utf-8

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

# reference data
L2_route_table = [
%w(post manage_action/song/madd manage_action#AddSongBasic),
%w(put manage_action/song/:songid manage_action#UpdateSongBasic),
%w(post manage_action/artist/madd manage_action#AddArtistBasic),
%w(put manage_action/artist/:artistid manage_action#UpdateArtistBasic),
%w(get social/fb/share fbshare#FBShare),
%w(get social/fb/share/callback fbshare#FBShareCallBack),
%w(get social/fb/query_count fbshare#GetFBCount),
%w(get social/fb/like fbshare#FBLike),
%w(get social/fb/cancel_like fbshare#CancelFBLike),
%w(get social/fb/result_redirect fbshare#ResultRedirect),
%w(get social/fb/add_share_recommend fbshare#AddShareRecommend),
%w(get social/fb/get_token fbshare#GetToken),
%w(get social/fb fbshare#HomeRedirect),
%w(get songdata/list songdata#AllSongListInfo),
%w(get songdata/list/free/listinfo songdata#FreeListInfo),
%w(get songdata/list/free songdata#FreeList),
%w(post manage_action/list/free/madd manage_action#AddFreeSong),
%w(put manage_action/list/free/:songid manage_action#UpdateFreeSongList),
%w(post manage_action/list/free/mdelete manage_action#DelFreeSong),
%w(get songdata/list/new/listinfo songdata#NewListInfo),
%w(get songdata/list/new songdata#NewList),
%w(post manage_action/list/new/madd manage_action#AddNewSong),
%w(put manage_action/list/new/:songid manage_action#UpdateNewSong),
%w(post manage_action/list/new/mdelete manage_action#DelNewSong),
%w(get songdata/list/hit songdata#HitList),
%w(get songdata/list/hit/listinfo songdata#HitListInfo),
%w(post manage_action/list/hit/madd manage_action#AddHitSong),
%w(put manage_action/list/hit/:songid manage_action#UpdateHitSong),
%w(post manage_action/list/hit/mdelete manage_action#DelHitSong),
%w(get songdata/list/mandarin_rank songdata#MandarinRankList),
%w(get songdata/list/mandarin_rank/listinfo songdata#MandarinRankListInfo),
%w(post manage_action/list/mandarin_rank/madd manage_action#AddMandarinRankSong),
%w(put manage_action/list/mandarin_rank/:songid manage_action#UpdateMandarinRankSong),
%w(post manage_action/list/mandarin_rank/mdelete manage_action#DelMandarinRankSong),
%w(get songdata/list/taiwanese_rank songdata#TaiwaneseRankList),
%w(get songdata/list/taiwanese_rank/listinfo songdata#TaiwaneseRankListInfo),
%w(post manage_action/list/taiwanese_rank/madd manage_action#AddTaiwaneseRankSong),
%w(put manage_action/list/taiwanese_rank/:songid manage_action#UpdateTaiwaneseRankSong),
%w(post manage_action/list/taiwanese_rank/mdelete manage_action#DelTaiwaneseRankSong),
%w(get songdata/list/other_rank songdata#OtherRankList),
%w(get songdata/list/other_rank/listinfo songdata#OtherRankListInfo),
%w(post manage_action/list/other_rank/madd manage_action#AddOtherRankSong),
%w(put manage_action/list/other_rank/:songid manage_action#UpdateOtherRankSong),
%w(post manage_action/list/other_rank/mdelete manage_action#DelOtherRankSong),
%w(get songdata/list/mandarin/phonetic/listinfo songdata#MandarinPhoneticListinfo),
%w(get songdata/list/mandarin/phonetic songdata#MandarinPhoneticAllList),
%w(get songdata/list/mandarin/phonetic/:id/listinfo songdata#MandarinPhoneticSingleListinfo),
%w(get songdata/list/mandarin/phonetic/:id songdata#MandarinPhoneticSingleList),
%w(get songdata/list/mandarin/words/listinfo songdata#MandarinWordsListinfo),
%w(get songdata/list/mandarin/words songdata#MandarinWordsAllList),
%w(get songdata/list/mandarin/words/:id/listinfo songdata#MandarinWordsSingleListinfo),
%w(get songdata/list/mandarin/words/:id songdata#MandarinWordsSingleList),
%w(get songdata/list/taiwanese/phonetic/listinfo songdata#TaiwanesePhoneticListinfo),
%w(get songdata/list/taiwanese/phonetic songdata#TaiwanesePhoneticAllList),
%w(get songdata/list/taiwanese/phonetic/:id/listinfo songdata#TaiwanesePhoneticSingleListinfo),
%w(get songdata/list/taiwanese/phonetic/:id songdata#TaiwanesePhoneticSingleList),
%w(get songdata/list/taiwanese/words/listinfo songdata#TaiwaneseWordsListinfo),
%w(get songdata/list/taiwanese/words songdata#TaiwaneseWordsAllList),
%w(get songdata/list/taiwanese/words/:id/listinfo songdata#TaiwaneseWordsSingleListinfo),
%w(get songdata/list/taiwanese/words/:id songdata#TaiwaneseWordsSingleList),
%w(get songdata/list/other/listinfo songdata#OtherListinfo),
%w(get songdata/list/other/alphabet songdata#OtherAlphabetAllList),
%w(get songdata/list/other/alphabet/:id/listinfo songdata#OtherAlphabetSingleListinfo),
%w(get songdata/list/other/alphabet/:id songdata#OtherAlphabetSingleList),
%w(get songdata/list/other/words songdata#OtherWordsAllList),
%w(get songdata/list/other/words/:id/listinfo songdata#OtherWordsSingleListinfo),
%w(get songdata/list/other/words/:id songdata#OtherWordsSingleList),
%w(get songdata/list/chorus_new_rank songdata#ChorusNewList),
%w(get songdata/list/chorus_new_rank/listinfo songdata#ChorusNewListInfo),
%w(post manage_action/list/chorus_new_rank/madd manage_action#AddChorusNewSong),
%w(put manage_action/list/chorus_new_rank/:songid manage_action#UpdateChorusNewSong),
%w(post manage_action/list/chorus_new_rank/mdelete manage_action#DelChorusNewSong),
%w(get songdata/list/chorus_hit_rank songdata#ChorusHitList),
%w(get songdata/list/chorus_hit_rank/listinfo songdata#ChorusHitListInfo),
%w(post manage_action/list/chorus_hit_rank/madd manage_action#AddChorusHitSong),
%w(put manage_action/list/chorus_hit_rank/:songid manage_action#UpdateChorusHitSong),
%w(post manage_action/list/chorus_hit_rank/mdelete manage_action#DelChorusHitSong),
%w(get songdata/list/chorus_mandarin_rank songdata#ChorusMandarinList),
%w(get songdata/list/chorus_mandarin_rank/listinfo songdata#ChorusMandarinListInfo),
%w(post manage_action/list/chorus_mandarin_rank/madd manage_action#AddChorusMandarinSong),
%w(put manage_action/list/chorus_mandarin_rank/:songid manage_action#UpdateChorusMandarinSong),
%w(post manage_action/list/chorus_mandarin_rank/mdelete manage_action#DelChorusMandarinSong),
%w(get songdata/list/chorus_taiwanese_rank songdata#ChorusTaiwanese),
%w(get songdata/list/chorus_taiwanese_rank/listinfo songdata#ChorusTaiwaneseListInfo),
%w(post manage_action/list/chorus_taiwanese_rank/madd manage_action#AddChorusTaiwaneseSong),
%w(put manage_action/list/chorus_taiwanese_rank/:songid manage_action#UpdateChorusTaiwaneseSong),
%w(post manage_action/list/chorus_taiwanese_rank/mdelete manage_action#DelChorusTaiwaneseSong),
%w(get songdata/list/chorus_other_rank songdata#ChorusOther),
%w(get songdata/list/chorus_other_rank/listinfo songdata#ChorusOtherListInfo),
%w(post manage_action/list/chorus_other_rank/madd manage_action#AddChorusOtherSong),
%w(put manage_action/list/chorus_other_rank/:songid manage_action#UpdateChorusOtherSong),
%w(post manage_action/list/chorus_other_rank/mdelete manage_action#DelChorusOtherSong),
%w(get manage_action/list/song_ksong_list/:songid iav#GetSongKSongList),
%w(get songdata/artist/listinfo songdata#ArtistListInfo),
%w(get songdata/artist/hit_rank songdata#ArtistHitRank),
%w(get songdata/artist/hit_rank/listinfo songdata#ArtistHitRankInfo),
%w(post manage_action/artist/hit_rank/madd manage_action#AddArtistHitRank),
%w(put manage_action/artist/hit_rank/:artistid manage_action#UpdateArtistHitRank),
%w(post manage_action/artist/hit_rank/mdelete manage_action#DelArtistHitRank),
%w(get songdata/artist/male/phonetic songdata#ArtistMalePhoneticListAll),
%w(get songdata/artist/male/phonetic/:id/listinfo songdata#ArtistMalePhoneticListinfo),
%w(get songdata/artist/male/phonetic/:id songdata#ArtistMalePhoneticList),
%w(get songdata/artist/female/phonetic songdata#ArtistFemalePhoneticListAll),
%w(get songdata/artist/female/phonetic/:id/listinfo songdata#ArtistFemalePhoneticListinfo),
%w(get songdata/artist/female/phonetic/:id songdata#ArtistFemalePhoneticList),
%w(get songdata/artist/group/phonetic songdata#ArtistGroupPhoneticListAll),
%w(get songdata/artist/group/phonetic/:id/listinfo songdata#ArtistGroupPhoneticListinfo),
%w(get songdata/artist/group/phonetic/:id songdata#ArtistGroupPhoneticList),
%w(get songdata/artist/:id songdata#ArtistInfo),
%w(get songdata/artist/:id/songlist songdata#ArtistSongList),
%w(get songdata/:id songdata#SongInformation),
%w(post manage_action/hit_add manage_action#AddSongSeenCount),
%w(%w(post manage_action/hit_get manage_action#GetSongSeenAndSingCount)),
%w(get user/:userid/song_to_sing user_song_to_sing#GetSongToSingList),
%w(post user/:userid/song_to_sing/add user_song_to_sing#AddSongToSingList),
%w(post user/:userid/song_to_sing/delete user_song_to_sing#DeleteSongToSingList),
%w(post user/:userid/song_to_sing/insert user_song_to_sing#InsertSongToSingList),
%w(get user/:userid/my_records iav#RecordList),
%w(get user/:userid/work_listinfo iav#WorkListInfo),
%w(get user/:userid/work iav#WorkList),
%w(post media/add_ksong iav#AddKSong),
%w(post media/complete_chorus iav#CompleteChorusSong),
%w(put media/ksong_file_status/:workid iav#KSongFileStatusUpdate),
%w(post user/:userid/ksong/mdelete iav#DelKSong),
%w(post user/:userid/ksong/mrestore iav#RestoreKSong),
%w(put user/:userid/ksong/:workid iav#UpdateKSong),
%w(put user/:userid/ksong/:workid/chorus_initiate iav#ChorusInitiate),
%w(put user/:userid/ksong/:workid/chorus_to_publish iav#ChorusToPublish),
%w(get user/:userid/ksong/temp_list iav#KSongTempList),
%w(get user/:userid/ksong/:workid iav#KSongInfo),
%w(get user/:userid/ksong iav#KSongList),
%w(put user/:userid/ksong/:workid/publish iav#KSongPublish),
%w(get user/:userid/ksong/chorus_wait_list iav#KSongChorusWaitList),
%w(get user/:userid/ksong/chorus_wait_commit iav#KSongChorusWaitCommit),
%w(get user/:userid/ksong/chorus_has_send iav#KSongChorusHasSend),
%w(get user/:userid/ksong/chorus_invite_list iav#KSongChorusInviteList),
%w(get user/:userid/ksong/:workid/chorus_invite_users iav#KSongChorusInviteUsers),
%w(put user/:userid/ksong/:workid/chorus_publish iav#KSongChorusPublish),
%w(get ksong/chorus_all_wait_list/:phoneid iav#KSongAllChorusWaitList),
%w(get user/:userid/ksong/:workid/comment_listinfo iav#KSongCommentListInfo),
%w(get user/:userid/ksong/:workid/comment_list iav#KSongCommentList),
%w(post user/:userid/ksong/:workid/add_comment iav#AddKSongComment),
%w(post user/:userid/ksong/:workid/del_comment iav#DelKSongComment),
%w(get songdata/:songid/song_ksong_list iav#GetSongKSongList),
%w(post media/add_ivideo iav#AddIVideo),
%w(put media/ivideo_file_status/:workid iav#IVideoFileStatusUpdate),
%w(put user/:userid/ivideo/:workid/publish iav#IVideoPublish),
%w(get user/:userid/ivideo iav#IVideoList),
%w(get user/:userid/ivideo/temp_list iav#IVideoTempList),
%w(put user/:userid/ivideo/:workid iav#UpdateIVideo),
%w(post user/:userid/ivideo/mdelete iav#DelIVideo),
%w(get user/:userid/ivideo/:workid iav#IVideoInfo),
%w(get user/:userid/ivideo/:workid/comment_listinfo iav#IVideoCommentListInfo),
%w(get user/:userid/ivideo/:workid/comment_list iav#IVideoCommentList),
%w(post user/:userid/ivideo/:workid/add_comment iav#AddIVideoComment),
%w(post user/:userid/ivideo/:workid/del_comment iav#DelIVideoComment),
%w(post manage_action/ranking_delete manage_action#DelRanking),
%w(get iav/hituser/listinfo iav_rank#HitUserListInfo),
%w(get iav/hituser iav_rank#HitUserList),
%w(post manage_action/hituser/madd manage_action#AddHitUser),
%w(put manage_action/hituser/:workid manage_action#UpdateHitUser),
%w(post manage_action/hituser/mdelete manage_action#DelHitUser),
%w(get iav/week_top_hit/listinfo iav_rank#WeekTopHitListInfo),
%w(get iav/week_top_hit iav_rank#WeekTopHitList),
%w(post manage_action/week_top_hit/madd manage_action#AddWeekTopHit),
%w(put manage_action/week_top_hit/:workid manage_action#UpdateWeekTopHit),
%w(post manage_action/week_top_hit/mdelete manage_action#DelWeekTopHit),
%w(post manage_action/hit_channel/madd manage_action#AddHitChannel),
%w(post manage_action/hit_photo_album/madd manage_action#AddHitPhotoAlbum),
%w(get iav/ksong_hit/listinfo iav_rank#KSongHitListInfo),
%w(get iav/ksong_hit iav_rank#KSongHitList),
%w(post manage_action/ksong_hit/madd manage_action#AddKSongHit),
%w(put manage_action/ksong_hit/:ksongid manage_action#UpdateKSongHit),
%w(post manage_action/ksong_hit/mdelete manage_action#DelKSongHit),
%w(get iav/ksong_new/listinfo iav_rank#KSongNewListInfo),
%w(get iav/ksong_new iav_rank#KSongNewList),
%w(post manage_action/ksong_new/madd manage_action#AddKSongNew),
%w(put manage_action/ksong_new/:ksongid manage_action#UpdateKSongNew),
%w(post manage_action/ksong_new/mdelete manage_action#DelKSongNew),
%w(get iav/video_hit/listinfo iav_rank#VideoHitListInfo),
%w(get iav/video_hit iav_rank#VideoHitList),
%w(post manage_action/video_hit/madd manage_action#AddVideoHit),
%w(put manage_action/video_hit/:ivideoid manage_action#UpdateVideoHit),
%w(post manage_action/video_hit/mdelete manage_action#DelVideoHit),
%w(get iav/video_new/listinfo iav_rank#VideoNewListInfo),
%w(get iav/video_new iav_rank#VideoNewList),
%w(post manage_action/video_new/madd manage_action#AddVideoNew),
%w(put manage_action/video_new/:ivideoid manage_action#UpdateVideoNew),
%w(post manage_action/video_new/mdelete manage_action#DelVideoNew),
%w(get iav/super_male/listinfo iav_rank#SuperMaleListInfo),
%w(get iav/super_male iav_rank#SuperMaleList),
%w(post manage_action/super_male/madd manage_action#AddSuperMale),
%w(put manage_action/super_male/:ksongid manage_action#UpdateSuperMale),
%w(post manage_action/super_male/mdelete manage_action#DelSuperMale),
%w(get iav/super_female/listinfo iav_rank#SuperFemaleListInfo),
%w(get iav/super_female iav_rank#SuperFemaleList),
%w(post manage_action/super_female/madd manage_action#AddSuperFemale),
%w(put manage_action/super_female/:ksongid manage_action#UpdateSuperFemale),
%w(post manage_action/super_female/mdelete manage_action#DelSuperFemale),
%w(get iav/super_chorus/listinfo iav_rank#SuperChorusListInfo),
%w(get iav/super_chorus iav_rank#SuperChorusList),
%w(post manage_action/super_chorus/madd manage_action#AddSuperChorus),
%w(put manage_action/super_chorus/:ksongid manage_action#UpdateSuperChorus),
%w(post manage_action/super_chorus/mdelete manage_action#DelSuperChorus),
%w(get iav/super_newbie/listinfo iav_rank#SuperNewbieListInfo),
%w(get iav/super_newbie iav_rank#SuperNewbieList),
%w(post manage_action/super_newbie/madd manage_action#AddSuperNewbie),
%w(put manage_action/super_newbie/:ksongid manage_action#UpdateSuperNewbie),
%w(post manage_action/super_newbie/mdelete manage_action#DelSuperNewbie),
%w(get iav/works_hit/listinfo iav_rank#WorksHitListInfo),
%w(get iav/works_hit iav_rank#WorksHitList),
%w(post manage_action/works_hit/madd manage_action#AddWorksHit),
%w(put manage_action/works_hit/:workid manage_action#UpdateWorksHit),
%w(post manage_action/works_hit/mdelete manage_action#DelWorksHit),
%w(get iav/works_new/listinfo iav_rank#WorksNewListInfo),
%w(get iav/works_new iav_rank#WorksNewList),
%w(post manage_action/works_new/madd manage_action#AddWorksNew),
%w(put manage_action/works_new/:workid manage_action#UpdateWorksNew),
%w(post manage_action/works_new/mdelete manage_action#DelWorksNew),
%w(get user/:userid/chinfo ichannel#UserChInfo),
%w(get user/:userid/channel_icon_set ichannel#UserChIconSet),
%w(put user/:userid/profile_photo_list ichannel#SetUserPhotoList),
%w(get ichannel/linestatus/listinfo ichannel#LineStatusListInfo),
%w(get ichannel/linestatus ichannel#LineStatusList),
%w(get ichannel/hit_channel_list ichannel#HitChannelList),
%w(get ichannel/hit_channel_list/auto_gen ichannel#HitChannelListAutoGen),
%w(post ichannel/hit_channel ichannel#AddHitChannel),
%w(put ichannel/hit_channel ichannel#SetHitChannel),
%w(post ichannel/hit_channel/mdelete ichannel#DelHitChannel),
%w(get ichannel/newbies/listinfo ichannel#NewbiesListInfo),
%w(get ichannel/newbies ichannel#NewbiesList),
%w(get ichannel/recommend/:type/listinfo ichannel#RecommendChListInfo),
%w(get ichannel/recommend/:type ichannel#RecommendChList),
%w(post ichannel/recommend/:type ichannel#AddRecommendChList),
%w(put ichannel/recommend/:type/:userid ichannel#UpdateRecommendChList),
%w(delete ichannel/recommend/:type/:userid ichannel#DelRecommendChList),
%w(get user/:userid/profile ichannel#UserBasicInfo),
%w(post user/:userid/profile ichannel#AddUserBasic),
%w(put user/:userid/profile ichannel#SetUserBasicInfo),
%w(put user/:userid/profile/visible ichannel#SetUserBasicPrivacy),
%w(get user/:userid/profile/visible ichannel#GetUserBasicPrivacy),
%w(put user/:userid/profile/privacy_setting ichannel#SetUserGlobalPrivacyDefaultSetting),
%w(get user/:userid/profile/privacy_setting ichannel#GetUserGlobalPrivacyDefaultSetting),
%w(post ichannel/error_log_filter_switch ichannel#ErrorLogFilterSwitch),
%w(get user/:userid/browsed/listinfo ichannel#BrowsedListInfo),
%w(get user/:userid/browsed ichannel#BrowsedList),
%w(get user/:userid/last_works_of_social ichannel#LastWorksOfMySocials),
%w(get user/:userid/songbook/listinfo ichannel#SongBookListInfo),
%w(get user/:userid/songbook ichannel#SongBookList),
%w(post user/:userid/songbook ichannel#AddSongBookList),
%w(put user/:userid/songbook/:songbookid ichannel#UpdateSongBookList),
%w(post user/:userid/songbook/mdelete ichannel#DelSongBookList),
%w(get user/:userid/songbook/:songbookid/listinfo ichannel#BookSongsListInfo),
%w(get user/:userid/songbook/:songbookid ichannel#BookSongsList),
%w(post user/:userid/songbook/:songbookid/madd ichannel#AddBookSongsList),
%w(post user/:userid/songbook/:songbookid/mdelete ichannel#DelBookSongsList),
%w(get user/:userid/friend_ksong_list/listinfo ichannel#FriendKSongListInfo),
%w(get user/:userid/friend_ksong_list ichannel#FriendKSongList),
%w(get user/:userid/idol_ksong_list/listinfo ichannel#IdolKSongListInfo),
%w(get user/:userid/idol_ksong_list ichannel#IdolKSongList),
%w(get ichannel/photo_album/hit_album_list ichannel#HitPhotoAlbumList),
%w(post ichannel/photo_album/hit_photo_album ichannel#AddHitPhotoAlbum),
%w(put ichannel/photo_album/hit_photo_album ichannel#SetHitPhotoAlbum),
%w(post ichannel/photo_album/hit_photo_album/mdelete ichannel#DelHitPhotoAlbum),
%w(get user/:userid/photo_album_comment/:photoalbumid/listinfo ichannel#PhotoAlbumCommentListInfo),
%w(get user/:userid/photo_album_comment/:photoalbumid ichannel#PhotoAlbumCommentList),
%w(post user/:userid/photo_album_comment/:photoalbumid ichannel#AddPhotoAlbumComment),
%w(post user/:userid/photo_album_comment/:photoalbumid/mdelete ichannel#DelPhotoAlbumComment),
%w(get user/:userid/photo_album/listinfo ichannel#UserPhotoAlbumListInfo),
%w(get user/:userid/photo_album ichannel#UserPhotoAlbumList),
%w(get user/:userid/photo_album/:photoalbumid/listinfo ichannel#PhotoAlbumPhotoListInfo),
%w(get user/:userid/photo_album/:photoalbumid/photo_list ichannel#PhotoAlbumPhotoList),
%w(get user/:userid/photo_album/:photoalbumid/photo_simple_list ichannel#PhotoSimpleList),
%w(get user/:userid/photo_album/:photoalbumid ichannel#PhotoAlbumInfo),
%w(post user/:userid/photo_album ichannel#AddPhotoAlbum),
%w(put user/:userid/photo_album/:photoalbumid ichannel#SetPhotoAlbum),
%w(post user/:userid/photo_album/mdelete ichannel#DelPhotoAlbum),
%w(post user/:userid/photo_album/:photoalbumid/photo_list/madd ichannel#AddPhotoAlbumPhoto),
%w(post user/:userid/photo_album/:photoalbumid/photo_list/mdelete ichannel#DelPhotoAlbumPhoto),
%w(get photo_information/:photoid ichannel#PhotoInfo),
%w(put user/:userid/photo_album/:photoalbumid/photo_list/:photoid ichannel#SetPhoto),
%w(get user/:userid/friend_photo_album/listinfo ichannel#FriendPhotoAlbumListInfo),
%w(get user/:userid/friend_photo_album ichannel#FriendPhotoAlbumList),
%w(post user/:userid/song_album ichannel#AddSongAlbum),
%w(post user/:userid/song_album/mdelete ichannel#DelSongAlbum),
%w(put user/:userid/song_album/:songalbumid ichannel#SetSongAlbum),
%w(put user/:userid/song_album/:songalbumid/report ichannel#AddSongAlbumReport),
%w(get user/:userid/song_album/personal/listinfo ichannel#UserPersonalSongAlbumListInfo),
%w(get user/:userid/song_album/personal ichannel#UserPersonalSongAlbumList),
%w(get user/:userid/song_album/collection/listinfo ichannel#UserCollectionSongAlbumListInfo),
%w(get user/:userid/song_album/collection ichannel#UserCollectionSongAlbumList),
%w(post user/:userid/song_album/collection/madd ichannel#AddUserCollectionSongAlbum),
%w(post user/:userid/song_album/collection/mdelete ichannel#DelUserCollectionSongAlbum),
%w(get user/:userid/friend_song_album/listinfo ichannel#FriendSongAlbumListInfo),
%w(get user/:userid/friend_song_album ichannel#FriendSongAlbumList),
%w(get user/:userid/idol_song_album/listinfo ichannel#IdolSongAlbumListInfo),
%w(get user/:userid/idol_song_album ichannel#IdolSongAlbumList),
%w(get ichannel/song_album/hit_album_list ichannel#HitSongAlbumList),
%w(post ichannel/song_album/hit_song_album ichannel#AddHitSongAlbum),
%w(put ichannel/song_album/hit_song_album ichannel#SetHitSongAlbum),
%w(post ichannel/song_album/hit_song_album/mdelete ichannel#DelHitSongAlbum),
%w(get ichannel/song_album/hit_idol_album_list/listinfo ichannel#HitIdolSongAlbumListInfo),
%w(get ichannel/song_album/hit_idol_album_list ichannel#HitIdolSongAlbumList),
%w(get user/:userid/song_album/:songalbumid/listinfo ichannel#SongAlbumSongListInfo),
%w(get user/:userid/song_album/:songalbumid/song_list ichannel#SongAlbumSongList),
%w(get user/:userid/song_album/:songalbumid ichannel#SongAlbumInfo),
%w(post user/:userid/song_album ichannel#AddSongAlbum),
%w(put user/:userid/song_album/:songalbumid ichannel#SetSongAlbum),
%w(post user/:userid/song_album/mdelete ichannel#DelSongAlbum),
%w(put user/:userid/song_album/:songalbumid/report ichannel#AddSongAlbumReport),
%w(post user/:userid/song_album/:songalbumid/song_list/madd ichannel#AddSongAlbumSong),
%w(post user/:userid/song_album/:songalbumid/song_list/mdelete ichannel#DelSongAlbumSong),
%w(get user/:userid/song_album_comment/:songalbumid/listinfo ichannel#SongAlbumCommentListInfo),
%w(get user/:userid/song_album_comment/:songalbumid ichannel#SongAlbumCommentList),
%w(post user/:userid/song_album_comment/:songalbumid ichannel#AddSongAlbumComment),
%w(post user/:userid/song_album_comment/:songalbumid/mdelete ichannel#DelSongAlbumComment),
%w(get user/:userid/ksong_status/listinfo ichannel#KSongStatusListInfo),
%w(post user/:userid/ksong_status/mdelete ichannel#DelKSongStatusItem),
%w(get user/:userid/ksong_status ichannel#KSongStatusList),
%w(put user/:userid/ksong_status/:kstatusid/report ichannel#KSongStatusReport),
%w(put user/:userid/ksong_status/:kstatusid/user_invisible ichannel#KSongStatusInvisible),
%w(put user/:userid/ksong_status/:kstatusid/share ichannel#KSongStatusReport),
%w(get user/:userid/user_flow/:flowid ichannel#FlowBasicInfo),
%w(post user/:userid/user_flow ichannel#AddFlowBasic),
%w(post user/:userid/user_flow/mdelete ichannel#DelFlowBasic),
%w(get user/:userid/user_flow_comment/:flowid ichannel#FlowCommentList),
%w(post user/:userid/user_flow_comment/:flowid ichannel#AddFlowComment),
%w(post user/:userid/user_flow_comment/:flowid/mdelete ichannel#DelFlowComment),
%w(get ichannel/mobile_upload_ksong/list ichannel#MobileUploadRecordList),
%w(get ichannel/special_effect_ksong/list ichannel#SpecialEffectRecordList),
%w(get ichannel/ksong_all/list ichannel#RecordPublishAllList),
%w(get user/:userid/friend_wish_list/listinfo ichannel#FriendWishListInfo),
%w(get user/:userid/friend_wish_list ichannel#FriendWishList),
%w(get ichannel/hit_idol_wish_list/listinfo ichannel#IdolWishListInfo),
%w(get ichannel/hit_idol_wish_list ichannel#IdolWishList),
%w(get user/:user_id/conversation/listinfo conversation#rep_listinfo),
%w(get user/:user_id/conversation conversation#rep_index),
%w(get conversation/with/:user_id conversation#rep_search),
%w(get conversation/:conv_id/listinfo conversation#listinfo),
%w(get conversation/:conv_id conversation#index),
%w(put conversation/:conv_id conversation#update),
%w(post conversation conversation#create),
%w(post conversation/:conv_id conversation#reply),
%w(delete conversation/:conv_id conversation#delete),
%w(get manage/notification_query_freq manage#NotificationQueryFreqInfo),
%w(post manage/notification_query_freq manage#SetNotificationQueryFreq),
%w(get manage/conversation_query_freq manage#ConversationQueryFreqInfo),
%w(post manage/conversation_query_freq manage#SetConversationQueryFreq),
%w(get manage/flurry_log_info manage#FlurryLogInfo),
%w(post manage/flurry_log_info manage#SetFlurryLogInfo),
%w(get manage/l2_err_output_filter manage#L2ErrOutputFilterInfo),
%w(post manage/l2_err_output_filter manage#SetL2ErrOutputFilter),
%w(get user/:userid/notification/listinfo notification#NotificationListInfo),
%w(get user/:userid/notification notification#NotificationList),
%w(get user/:userid/relation common#RelationQuery),
%w(post user/:userid/add_relation common#AddRelation),
%w(post user/:userid/break_relation common#BreakRelation),
%w(get user/:userid/relation/:request_type/list common#RelationList),
%w(get user/:userid/relation/:request_type/listinfo common#RelationListInfo),
%w(post add_work_count_seen common#IncreaseWorkCountSeen),
%w(get user/:userid/relation/:request_user_id/common_friend/listinfo common#CommonFriendListInfo),
%w(get user/:userid/relation/:request_user_id/common_friend common#CommonFriendList),
%w(get user/:userid/relation/:request_user_id/common_idol/listinfo common#CommonIdolListInfo),
%w(get user/:userid/relation/:request_user_id/common_idol common#CommonIdolList),
%w(get user/:userid/relation/:request_user_id/common_songbook/listinfo common#CommonSongBookListInfo),
%w(get user/:userid/relation/:request_user_id/common_songbook common#CommonSongBookList),
%w(get search/word_autocomp search#word_auto_complete),
%w(get search/songs search#songs),
%w(get search/artists search#artists),
%w(get search/members search#members),
%w(get search/works search#works),
%w(get search search#all),
%w(get user/:userid/sponsor sponsor#SponsorList),
%w(post user/:userid/sponsor sponsor#SponsorUser),
%w(get autoranking/testapi auto_ranking#TestApi),
%w(get autoranking/ksong_hit auto_ranking#AutoHitKSongRanking),
%w(get autoranking/work_hit auto_ranking#AutoHitWorkRanking),
%w(get autoranking/video_hit auto_ranking#AutoHitVideoRanking),
%w(get autoranking/super_male auto_ranking#AutoSuperMaleRanking),
%w(get autoranking/super_female auto_ranking#AutoSuperFemaleRanking),
%w(get autoranking/super_chorus auto_ranking#AutoSuperChorusRanking),
%w(get autoranking/super_newbie auto_ranking#AutoSuperNewbieRanking),
%w(get autoranking/hit_channel auto_ranking#AutoHitChannelRanking),
%w(get autoranking/hit_photo_album auto_ranking#AutoHitPhotoAlbumRanking),
%w(get statistics/by_timestamp/reply statistics_by_timestamp#GetReplyCountByTimeStamp),
%w(get statistics/by_timestamp/seen statistics_by_timestamp#GetSeenCountByTimeStamp),
%w(get statistics/by_timestamp/social statistics_by_timestamp#GetSocialCountByTimeStamp),
%w(get statistics/by_timestamp/work statistics_by_timestamp#GetWorkCountByTimeStamp)
].uniq!


# input data
log_folder = 'log'
log_files = Dir.glob("#{log_folder}/*/*") 
#log_files = Dir.glob("#{log_folder}/**/*") 
#log_files = Dir.glob("#{log_folder}/**/*/") 
request_method = [['"PUT /','put'], ['"DELETE /','delete'], ['"GET /', 'get'], ['"POST /', 'post']]

# cache file
cache_file = 'cache'
tmp = []
#tmp = File.exist?(cache_file) ? Marshal.load(File.read(cache_file)) : []
match_count = 0
unmatch_count = 0
doc_missing = 0

# parse api from log file
p 'parse api from log file'
if tmp.empty?
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
      end
    end
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
L2_route_table.each do |method, api, func|
  formatted_api = api.gsub(/:\w+/,'*')
  group = func.split('#')[0]

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
    p [api, group, match, method, func, formatted_api, doc_link, doc_title]
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
p 'generate html file'
File.open('SBE_L2_API_usage_report.html', 'w') do |f| 
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
  
  output.sort.reverse.each do |k,v|
    title, info = v
    f.write "<br><h1>#{title}</h1><br>"
    info.each do |api, group, match, method, func, formatted_api, doc_link, doc_title|
      method = {'get' => '___get', 'put' => '___put', 'post' => '__post', 'delete' => 'delete'}[method]
      f.write("<font color='\#B57419'>") if match == '0'
      f.write("#{method} #{api} => #{func} ")
      f.write(" <a href='#{doc_link}'>[#{doc_title}]</a>")
      f.write("</font>") if match == '0'
      f.write("<br>")
    end
  end
  f.write '</body></html>'
end