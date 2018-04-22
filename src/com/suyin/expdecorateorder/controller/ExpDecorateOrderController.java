
package com.suyin.expdecorateorder.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.suyin.expdecorateorder.model.ExpDecorateOrder;
import com.suyin.expdecorateorder.service.ExpDecorateOrderService;
import com.suyin.system.model.Page;
import com.suyin.system.util.Tools;



@Controller
@RequestMapping("/expdecorateorder")
public class ExpDecorateOrderController{

    private final static Logger log=Logger.getLogger(ExpDecorateOrderController.class);
    @Autowired
    private ExpDecorateOrderService expDecorateOrderService;

    /**
     * 首页
     * @return 
     * @see
     */
    @RequestMapping(value="/index")
    public ModelAndView index() {

        return new ModelAndView("expdecorateorder/index");
    }


    /**
     * 读取列表
     * @param request
     * @return 
     * @see
     */
    @RequestMapping(value = "/list")
    public @ResponseBody Map<String, Object> findForExpDecorateOrderAll(HttpServletRequest request) {
        ModelMap map=new ModelMap();

        String pag = request.getParameter("page");
        String showCount = request.getParameter("rows");
        Page page = new Page();
        try
        {      
            if (null != pag && null != showCount) {
                page.setCurrentPage(Integer.parseInt(pag));
                page.setShowCount(Integer.parseInt(showCount));
            }

            ExpDecorateOrder  entityInfo=new ExpDecorateOrder ();
            entityInfo.setPage(page);
            List<ExpDecorateOrder > list=expDecorateOrderService.findExpDecorateOrderByPage(entityInfo);
            map.put("rows",list); 
            map.put("total",entityInfo.getPage().getTotalResult()); 

        }
        catch (Exception e)
        {
            log.error("Controller Error ExpDecorateOrderController-> findExpDecorateOrderByWhere  " + e.getMessage());
        }

        return map;
    }




    /**
     * 跳转添加页面
     * @param request
     * @return
     */
    @RequestMapping(value = "/jumpAdd")
    public ModelAndView jumpExpDecorateOrderAdd(HttpServletRequest request) {
        ModelMap map=new ModelMap();

        return new ModelAndView("expdecorateorder/save",map);
    }

    /**
     * 跳转修改页面 
     * @param request
     * @return
     */
    @RequestMapping(value = "/jumpEdit")
    public ModelAndView jumpExpDecorateOrderEdit(HttpServletRequest request) {
        ModelMap map=new ModelMap();
        try
        {

            if(Tools.notEmpty(request.getParameter("id"))){  
                
                ExpDecorateOrder entity=new ExpDecorateOrder();
                entity.setOrderId(Integer.parseInt(request.getParameter("id")));
                entity=expDecorateOrderService.findExpDecorateOrderById(entity);
                map.put("expdecorateorder",entity);

            }
        }
        catch (Exception e)
        {

            log.error("Controller Error ExpDecorateOrderController-> jumpExpDecorateOrderEdit  " + e.getMessage());
        }
        return new ModelAndView("expdecorateorder/edit",map);
    }

    /**
     * 信息保存
     * Description: <br>
     * @param 
     * @return 
     * @see
     */
    @RequestMapping(value = "/add")
    public @ResponseBody Map<String, Object> saveExpDecorateOrderInfo(ExpDecorateOrder entity) {
        ModelMap map=new ModelMap();
        try
        {
            
            map.put("result",expDecorateOrderService.addExpDecorateOrder(entity));
        }
        catch (Exception e)
        {
            log.error("Controller Error ExpDecorateOrderController-> saveExpDecorateOrderInfo " + e.getMessage());
        }
        return map;
    }
    /**
     * 信息修改
     * Description: <br>
     * @param 
     * @return 
     * @see
     */
    @RequestMapping(value = "/update")
    public @ResponseBody Map<String, Object> updateExpDecorateOrderById(ExpDecorateOrder entity) {
        ModelMap map=new ModelMap();
        try
        {            
            map.put("result",expDecorateOrderService.updateExpDecorateOrder(entity));
        }
        catch (Exception e)
        {
            log.error("Controller Error ExpDecorateOrderController-> updateExpDecorateOrderById  " + e.getMessage());
        }
        return map;
    }

    /**
     * 信息删除
     * @param 
     * @return
     */
    @RequestMapping(value = "/delete")
    public @ResponseBody Map<String, Object> deleteExpDecorateOrderById(String id) {

        ModelMap map=new ModelMap();
        try
        {
            if(Tools.notEmpty(id)){
                
                map.put("result",expDecorateOrderService.deleteExpDecorateOrder(id));
            }  
        }
        catch (Exception e)
        {
            log.error("Controller Error ExpDecorateOrderController-> deleteExpDecorateOrderById  " + e.getMessage());
        }
 
        return map;
    }


}

