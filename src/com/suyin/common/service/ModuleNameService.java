package com.suyin.common.service;

/**
 * 获取模块名称,(把这个东西也归spring管理啊，别忘了)
 * @author Administrator
 *
 */
public interface ModuleNameService
{

    //商家模块
    public static final String SHOP = "shop";

    //广告
    public final static String ADV = "adv";

    //产品
    public final static String PRO = "pro";

    //商家
    public final static String MEMBER = "member";

    //两个赚(维护用)
    public final static String EXP_ZHUAN = "zhuan";

    //4个活动
    public final static String EXP = "exp";

    public final static String THEME = "theme";

    //优惠和主题
    public final static String THEME_DISCOUNT = "theme_discount";

    //主题月
    public final static String THEME_MONTH = "theme_month";

    //关于
    public static final String ABOUT = "about";

    //合作商家
    public static final String COMPANY = "company";

    //用户评论
    public static final String COMMENT = "comment";

    //就是用户头像了
    public static final String USER = "user";

    //参加齐心赚，上传的图片
    public static final String USER_EXP_ZHUAN = "user_exp_zhuan";

    //全民赚，上传下载 范例图片
    public static final String EXP_APP_IMG = "exp_all_app_img";

    //活动说明
    public static final String ACT_INTRO = "act_intro";

    public String getModuleName(String alias);
}
