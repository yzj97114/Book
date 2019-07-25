<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>资源管理</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>系统管理</a>
              <a><cite>菜单管理</cite></a>
        </span>
    </div>
    <!-- 内容主体区域 -->
    <div class="content">
        <div class="search">
            <blockquote class="layui-elem-quote">
                <button class="layui-btn" type="button" onclick="addResourcePopBox()"><i class="layui-icon">
                    &#xe608;</i>新增
                </button>
            </blockquote>
        </div>
        <div class="table-list">
            <table class="layui-table" id="resourceTableTree">
                <colgroup>
                    <col width="80">
                    <col width="300">
                    <col width="200">
                    <col width="100">
                    <col width="150">
                    <col width="100">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>资源名称</th>
                        <th>资源路径</th>
                        <th>资源类型</th>
                        <th>图标</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${resourceList}" var="resource" varStatus="i">
                        <tr data-tb-pid="${resource.pid}" data-tb-id="${resource.id}">
                            <td class="center">${i.index+1}</td>
                            <td class="center">${resource.name}</td>
                            <td class="center">${resource.url}</td>
                            <td class="center">${resource.resourceType.label}</td>
                            <td class="center">${resource.icon}</td>
                            <td class="center">${resource.state.label}</td>
                            <td>启用</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 添加资源框-->
<div id="addResource" class="popBox layui-hide">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><span class="tip">*</span>资源名称：</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">资源类型：</label>
                <div class="layui-input-inline">
                    <select name="resourceType">
                        <c:forEach var="resourceType" items="${resourceTypeEnum}">
                            <option value="${resourceType.getCode()}">${resourceType.getLabel()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">资源路径：</label>
                <div class="layui-input-inline">
                    <input type="text" name="url" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label"><span class="tip">*</span>排序：</label>
                <div class="layui-input-inline">
                    <input type="number" value="1" min="0" name="sort" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">菜单图标：</label>
                <div class="layui-input-inline">
                    <input type="text" onclick="setIcon()" name="icon" readonly autocomplete="off" class="layui-input">
                </div>
                <button type="button" onclick="setIcon()" class="layui-btn layui-btn-primary"
                        style="position: absolute; left: 244px;"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">上级资源：</label>
                <div class="layui-input-inline">
                    <input type="text" id="pid" autocomplete="off" class="layui-input" readonly onclick="showMenu();">
                    <input type="hidden" name="pid" autocomplete="off" class="layui-input">
                    <div id="resourceTreeContent" class="myTree">
                        <ul id="resourceTree" class="ztree"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-block">
                    <input type="checkbox" checked="" name="state" value="1" lay-skin="switch"
                           lay-filter="resourceState"
                           lay-text="正常|禁用">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">描述：</label>
            <div class="layui-input-block" style="width: 514px;">
                <textarea placeholder="请输入描述信息" class="layui-textarea"></textarea>
            </div>
        </div>
    </form>
</div>
<!-- 设置图标-->
<div id="setIcon" class="popBox layui-hide" style="padding: 10px 10px">
    <div class="icon">
        <ul class="icon-list">
            <li><span class="fa fa-bluetooth" aria-hidden="true"></span><span class="label">fa fa-bluetooth</span></li>
            <li><span class="fa fa-bluetooth-b" aria-hidden="true"></span><span class="label">fa fa-bluetooth-b</span>
            </li>
            <li><span class="fa fa-codiepie" aria-hidden="true"></span><span class="label">fa fa-codiepie</span></li>
            <li><span class="fa fa-credit-card-alt" aria-hidden="true"></span><span
                    class="label">fa fa-credit-card-alt</span></li>
            <li><span class="fa fa-edge" aria-hidden="true"></span><span class="label">fa fa-edge</span></li>
            <li><span class="fa fa-fort-awesome" aria-hidden="true"></span><span class="label">fa fa-fort-awesome</span>
            </li>
            <li><span class="fa fa-hashtag" aria-hidden="true"></span><span class="label">fa fa-hashtag</span></li>
            <li><span class="fa fa-mixcloud" aria-hidden="true"></span><span class="label">fa fa-mixcloud</span></li>
            <li><span class="fa fa-modx" aria-hidden="true"></span><span class="label">fa fa-modx</span></li>
            <li><span class="fa fa-pause-circle" aria-hidden="true"></span><span class="label">fa fa-pause-circle</span>
            </li>
            <li><span class="fa fa-pause-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-pause-circle-o</span></li>
            <li><span class="fa fa-percent" aria-hidden="true"></span><span class="label">fa fa-percent</span></li>
            <li><span class="fa fa-product-hunt" aria-hidden="true"></span><span class="label">fa fa-product-hunt</span>
            </li>
            <li><span class="fa fa-reddit-alien" aria-hidden="true"></span><span class="label">fa fa-reddit-alien</span>
            </li>
            <li><span class="fa fa-scribd" aria-hidden="true"></span><span class="label">fa fa-scribd</span></li>
            <li><span class="fa fa-shopping-bag" aria-hidden="true"></span><span class="label">fa fa-shopping-bag</span>
            </li>
            <li><span class="fa fa-shopping-basket" aria-hidden="true"></span><span
                    class="label">fa fa-shopping-basket</span></li>
            <li><span class="fa fa-stop-circle" aria-hidden="true"></span><span class="label">fa fa-stop-circle</span>
            </li>
            <li><span class="fa fa-stop-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-stop-circle-o</span></li>
            <li><span class="fa fa-usb" aria-hidden="true"></span><span class="label">fa fa-usb</span></li>
            <li><span class="fa fa-adjust" aria-hidden="true"></span><span class="label">fa fa-adjust</span></li>
            <li><span class="fa fa-anchor" aria-hidden="true"></span><span class="label">fa fa-anchor</span></li>
            <li><span class="fa fa-archive" aria-hidden="true"></span><span class="label">fa fa-archive</span></li>
            <li><span class="fa fa-area-chart" aria-hidden="true"></span><span class="label">fa fa-area-chart</span>
            </li>
            <li><span class="fa fa-arrows" aria-hidden="true"></span><span class="label">fa fa-arrows</span></li>
            <li><span class="fa fa-arrows-h" aria-hidden="true"></span><span class="label">fa fa-arrows-h</span></li>
            <li><span class="fa fa-arrows-v" aria-hidden="true"></span><span class="label">fa fa-arrows-v</span></li>
            <li><span class="fa fa-asterisk" aria-hidden="true"></span><span class="label">fa fa-asterisk</span></li>
            <li><span class="fa fa-at" aria-hidden="true"></span><span class="label">fa fa-at</span></li>
            <li><span class="fa fa-automobile" aria-hidden="true"></span><span class="label">fa fa-automobile</span>
            </li>
            <li><span class="fa fa-balance-scale" aria-hidden="true"></span><span
                    class="label">fa fa-balance-scale</span></li>
            <li><span class="fa fa-ban" aria-hidden="true"></span><span class="label">fa fa-ban</span></li>
            <li><span class="fa fa-bank" aria-hidden="true"></span><span class="label">fa fa-bank</span></li>
            <li><span class="fa fa-bar-chart" aria-hidden="true"></span><span class="label">fa fa-bar-chart</span></li>
            <li><span class="fa fa-bar-chart-o" aria-hidden="true"></span><span class="label">fa fa-bar-chart-o</span>
            </li>
            <li><span class="fa fa-barcode" aria-hidden="true"></span><span class="label">fa fa-barcode</span></li>
            <li><span class="fa fa-bars" aria-hidden="true"></span><span class="label">fa fa-bars</span></li>
            <li><span class="fa fa-battery-0" aria-hidden="true"></span><span class="label">fa fa-battery-0</span></li>
            <li><span class="fa fa-battery-1" aria-hidden="true"></span><span class="label">fa fa-battery-1</span></li>
            <li><span class="fa fa-battery-2" aria-hidden="true"></span><span class="label">fa fa-battery-2</span></li>
            <li><span class="fa fa-battery-3" aria-hidden="true"></span><span class="label">fa fa-battery-3</span></li>
            <li><span class="fa fa-battery-4" aria-hidden="true"></span><span class="label">fa fa-battery-4</span></li>
            <li><span class="fa fa-battery-empty" aria-hidden="true"></span><span
                    class="label">fa fa-battery-empty</span></li>
            <li><span class="fa fa-battery-full" aria-hidden="true"></span><span class="label">fa fa-battery-full</span>
            </li>
            <li><span class="fa fa-battery-half" aria-hidden="true"></span><span class="label">fa fa-battery-half</span>
            </li>
            <li><span class="fa fa-battery-quarter" aria-hidden="true"></span><span
                    class="label">fa fa-battery-quarter</span></li>
            <li><span class="fa fa-battery-three-quarters" aria-hidden="true"></span><span class="label">fa fa-battery-three-quarters</span>
            </li>
            <li><span class="fa fa-bed" aria-hidden="true"></span><span class="label">fa fa-bed</span></li>
            <li><span class="fa fa-beer" aria-hidden="true"></span><span class="label">fa fa-beer</span></li>
            <li><span class="fa fa-bell" aria-hidden="true"></span><span class="label">fa fa-bell</span></li>
            <li><span class="fa fa-bell-o" aria-hidden="true"></span><span class="label">fa fa-bell-o</span></li>
            <li><span class="fa fa-bell-slash" aria-hidden="true"></span><span class="label">fa fa-bell-slash</span>
            </li>
            <li><span class="fa fa-bell-slash-o" aria-hidden="true"></span><span class="label">fa fa-bell-slash-o</span>
            </li>
            <li><span class="fa fa-bicycle" aria-hidden="true"></span><span class="label">fa fa-bicycle</span></li>
            <li><span class="fa fa-binoculars" aria-hidden="true"></span><span class="label">fa fa-binoculars</span>
            </li>
            <li><span class="fa fa-birthday-cake" aria-hidden="true"></span><span
                    class="label">fa fa-birthday-cake</span></li>
            <li><span class="fa fa-bluetooth" aria-hidden="true"></span><span class="label">fa fa-bluetooth</span></li>
            <li><span class="fa fa-bluetooth-b" aria-hidden="true"></span><span class="label">fa fa-bluetooth-b</span>
            </li>
            <li><span class="fa fa-bolt" aria-hidden="true"></span><span class="label">fa fa-bolt</span></li>
            <li><span class="fa fa-bomb" aria-hidden="true"></span><span class="label">fa fa-bomb</span></li>
            <li><span class="fa fa-book" aria-hidden="true"></span><span class="label">fa fa-book</span></li>
            <li><span class="fa fa-bookmark" aria-hidden="true"></span><span class="label">fa fa-bookmark</span></li>
            <li><span class="fa fa-bookmark-o" aria-hidden="true"></span><span class="label">fa fa-bookmark-o</span>
            </li>
            <li><span class="fa fa-briefcase" aria-hidden="true"></span><span class="label">fa fa-briefcase</span></li>
            <li><span class="fa fa-bug" aria-hidden="true"></span><span class="label">fa fa-bug</span></li>
            <li><span class="fa fa-building" aria-hidden="true"></span><span class="label">fa fa-building</span></li>
            <li><span class="fa fa-building-o" aria-hidden="true"></span><span class="label">fa fa-building-o</span>
            </li>
            <li><span class="fa fa-bullhorn" aria-hidden="true"></span><span class="label">fa fa-bullhorn</span></li>
            <li><span class="fa fa-bullseye" aria-hidden="true"></span><span class="label">fa fa-bullseye</span></li>
            <li><span class="fa fa-bus" aria-hidden="true"></span><span class="label">fa fa-bus</span></li>
            <li><span class="fa fa-cab" aria-hidden="true"></span><span class="label">fa fa-cab</span></li>
            <li><span class="fa fa-calculator" aria-hidden="true"></span><span class="label">fa fa-calculator</span>
            </li>
            <li><span class="fa fa-calendar" aria-hidden="true"></span><span class="label">fa fa-calendar</span></li>
            <li><span class="fa fa-calendar-check-o" aria-hidden="true"></span><span class="label">fa fa-calendar-check-o</span>
            </li>
            <li><span class="fa fa-calendar-minus-o" aria-hidden="true"></span><span class="label">fa fa-calendar-minus-o</span>
            </li>
            <li><span class="fa fa-calendar-o" aria-hidden="true"></span><span class="label">fa fa-calendar-o</span>
            </li>
            <li><span class="fa fa-calendar-plus-o" aria-hidden="true"></span><span
                    class="label">fa fa-calendar-plus-o</span></li>
            <li><span class="fa fa-calendar-times-o" aria-hidden="true"></span><span class="label">fa fa-calendar-times-o</span>
            </li>
            <li><span class="fa fa-camera" aria-hidden="true"></span><span class="label">fa fa-camera</span></li>
            <li><span class="fa fa-camera-retro" aria-hidden="true"></span><span class="label">fa fa-camera-retro</span>
            </li>
            <li><span class="fa fa-car" aria-hidden="true"></span><span class="label">fa fa-car</span></li>
            <li><span class="fa fa-caret-square-o-down" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-down</span>
            </li>
            <li><span class="fa fa-caret-square-o-left" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-left</span>
            </li>
            <li><span class="fa fa-caret-square-o-right" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-right</span>
            </li>
            <li><span class="fa fa-caret-square-o-up" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-up</span>
            </li>
            <li><span class="fa fa-cart-arrow-down" aria-hidden="true"></span><span
                    class="label">fa fa-cart-arrow-down</span></li>
            <li><span class="fa fa-cart-plus" aria-hidden="true"></span><span class="label">fa fa-cart-plus</span></li>
            <li><span class="fa fa-cc" aria-hidden="true"></span><span class="label">fa fa-cc</span></li>
            <li><span class="fa fa-certificate" aria-hidden="true"></span><span class="label">fa fa-certificate</span>
            </li>
            <li><span class="fa fa-check" aria-hidden="true"></span><span class="label">fa fa-check</span></li>
            <li><span class="fa fa-check-circle" aria-hidden="true"></span><span class="label">fa fa-check-circle</span>
            </li>
            <li><span class="fa fa-check-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-check-circle-o</span></li>
            <li><span class="fa fa-check-square" aria-hidden="true"></span><span class="label">fa fa-check-square</span>
            </li>
            <li><span class="fa fa-check-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-check-square-o</span></li>
            <li><span class="fa fa-child" aria-hidden="true"></span><span class="label">fa fa-child</span></li>
            <li><span class="fa fa-circle" aria-hidden="true"></span><span class="label">fa fa-circle</span></li>
            <li><span class="fa fa-circle-o" aria-hidden="true"></span><span class="label">fa fa-circle-o</span></li>
            <li><span class="fa fa-circle-o-notch" aria-hidden="true"></span><span
                    class="label">fa fa-circle-o-notch</span></li>
            <li><span class="fa fa-circle-thin" aria-hidden="true"></span><span class="label">fa fa-circle-thin</span>
            </li>
            <li><span class="fa fa-clock-o" aria-hidden="true"></span><span class="label">fa fa-clock-o</span></li>
            <li><span class="fa fa-clone" aria-hidden="true"></span><span class="label">fa fa-clone</span></li>
            <li><span class="fa fa-close" aria-hidden="true"></span><span class="label">fa fa-close</span></li>
            <li><span class="fa fa-cloud" aria-hidden="true"></span><span class="label">fa fa-cloud</span></li>
            <li><span class="fa fa-cloud-download" aria-hidden="true"></span><span
                    class="label">fa fa-cloud-download</span></li>
            <li><span class="fa fa-cloud-upload" aria-hidden="true"></span><span class="label">fa fa-cloud-upload</span>
            </li>
            <li><span class="fa fa-code" aria-hidden="true"></span><span class="label">fa fa-code</span></li>
            <li><span class="fa fa-code-fork" aria-hidden="true"></span><span class="label">fa fa-code-fork</span></li>
            <li><span class="fa fa-coffee" aria-hidden="true"></span><span class="label">fa fa-coffee</span></li>
            <li><span class="fa fa-cog" aria-hidden="true"></span><span class="label">fa fa-cog</span></li>
            <li><span class="fa fa-cogs" aria-hidden="true"></span><span class="label">fa fa-cogs</span></li>
            <li><span class="fa fa-comment" aria-hidden="true"></span><span class="label">fa fa-comment</span></li>
            <li><span class="fa fa-comment-o" aria-hidden="true"></span><span class="label">fa fa-comment-o</span></li>
            <li><span class="fa fa-commenting" aria-hidden="true"></span><span class="label">fa fa-commenting</span>
            </li>
            <li><span class="fa fa-commenting-o" aria-hidden="true"></span><span class="label">fa fa-commenting-o</span>
            </li>
            <li><span class="fa fa-comments" aria-hidden="true"></span><span class="label">fa fa-comments</span></li>
            <li><span class="fa fa-comments-o" aria-hidden="true"></span><span class="label">fa fa-comments-o</span>
            </li>
            <li><span class="fa fa-compass" aria-hidden="true"></span><span class="label">fa fa-compass</span></li>
            <li><span class="fa fa-copyright" aria-hidden="true"></span><span class="label">fa fa-copyright</span></li>
            <li><span class="fa fa-creative-commons" aria-hidden="true"></span><span class="label">fa fa-creative-commons</span>
            </li>
            <li><span class="fa fa-credit-card" aria-hidden="true"></span><span class="label">fa fa-credit-card</span>
            </li>
            <li><span class="fa fa-credit-card-alt" aria-hidden="true"></span><span
                    class="label">fa fa-credit-card-alt</span></li>
            <li><span class="fa fa-crop" aria-hidden="true"></span><span class="label">fa fa-crop</span></li>
            <li><span class="fa fa-crosshairs" aria-hidden="true"></span><span class="label">fa fa-crosshairs</span>
            </li>
            <li><span class="fa fa-cube" aria-hidden="true"></span><span class="label">fa fa-cube</span></li>
            <li><span class="fa fa-cubes" aria-hidden="true"></span><span class="label">fa fa-cubes</span></li>
            <li><span class="fa fa-cutlery" aria-hidden="true"></span><span class="label">fa fa-cutlery</span></li>
            <li><span class="fa fa-dashboard" aria-hidden="true"></span><span class="label">fa fa-dashboard</span></li>
            <li><span class="fa fa-database" aria-hidden="true"></span><span class="label">fa fa-database</span></li>
            <li><span class="fa fa-desktop" aria-hidden="true"></span><span class="label">fa fa-desktop</span></li>
            <li><span class="fa fa-diamond" aria-hidden="true"></span><span class="label">fa fa-diamond</span></li>
            <li><span class="fa fa-dot-circle-o" aria-hidden="true"></span><span class="label">fa fa-dot-circle-o</span>
            </li>
            <li><span class="fa fa-download" aria-hidden="true"></span><span class="label">fa fa-download</span></li>
            <li><span class="fa fa-edit" aria-hidden="true"></span><span class="label">fa fa-edit</span></li>
            <li><span class="fa fa-ellipsis-h" aria-hidden="true"></span><span class="label">fa fa-ellipsis-h</span>
            </li>
            <li><span class="fa fa-ellipsis-v" aria-hidden="true"></span><span class="label">fa fa-ellipsis-v</span>
            </li>
            <li><span class="fa fa-envelope" aria-hidden="true"></span><span class="label">fa fa-envelope</span></li>
            <li><span class="fa fa-envelope-o" aria-hidden="true"></span><span class="label">fa fa-envelope-o</span>
            </li>
            <li><span class="fa fa-envelope-square" aria-hidden="true"></span><span
                    class="label">fa fa-envelope-square</span></li>
            <li><span class="fa fa-eraser" aria-hidden="true"></span><span class="label">fa fa-eraser</span></li>
            <li><span class="fa fa-exchange" aria-hidden="true"></span><span class="label">fa fa-exchange</span></li>
            <li><span class="fa fa-exclamation" aria-hidden="true"></span><span class="label">fa fa-exclamation</span>
            </li>
            <li><span class="fa fa-exclamation-circle" aria-hidden="true"></span><span class="label">fa fa-exclamation-circle</span>
            </li>
            <li><span class="fa fa-exclamation-triangle" aria-hidden="true"></span><span class="label">fa fa-exclamation-triangle</span>
            </li>
            <li><span class="fa fa-external-link" aria-hidden="true"></span><span
                    class="label">fa fa-external-link</span></li>
            <li><span class="fa fa-external-link-square" aria-hidden="true"></span><span class="label">fa fa-external-link-square</span>
            </li>
            <li><span class="fa fa-eye" aria-hidden="true"></span><span class="label">fa fa-eye</span></li>
            <li><span class="fa fa-eye-slash" aria-hidden="true"></span><span class="label">fa fa-eye-slash</span></li>
            <li><span class="fa fa-eyedropper" aria-hidden="true"></span><span class="label">fa fa-eyedropper</span>
            </li>
            <li><span class="fa fa-fax" aria-hidden="true"></span><span class="label">fa fa-fax</span></li>
            <li><span class="fa fa-feed" aria-hidden="true"></span><span class="label">fa fa-feed</span></li>
            <li><span class="fa fa-female" aria-hidden="true"></span><span class="label">fa fa-female</span></li>
            <li><span class="fa fa-fighter-jet" aria-hidden="true"></span><span class="label">fa fa-fighter-jet</span>
            </li>
            <li><span class="fa fa-file-archive-o" aria-hidden="true"></span><span
                    class="label">fa fa-file-archive-o</span></li>
            <li><span class="fa fa-file-audio-o" aria-hidden="true"></span><span class="label">fa fa-file-audio-o</span>
            </li>
            <li><span class="fa fa-file-code-o" aria-hidden="true"></span><span class="label">fa fa-file-code-o</span>
            </li>
            <li><span class="fa fa-file-excel-o" aria-hidden="true"></span><span class="label">fa fa-file-excel-o</span>
            </li>
            <li><span class="fa fa-file-image-o" aria-hidden="true"></span><span class="label">fa fa-file-image-o</span>
            </li>
            <li><span class="fa fa-file-movie-o" aria-hidden="true"></span><span class="label">fa fa-file-movie-o</span>
            </li>
            <li><span class="fa fa-file-pdf-o" aria-hidden="true"></span><span class="label">fa fa-file-pdf-o</span>
            </li>
            <li><span class="fa fa-file-photo-o" aria-hidden="true"></span><span class="label">fa fa-file-photo-o</span>
            </li>
            <li><span class="fa fa-file-picture-o" aria-hidden="true"></span><span
                    class="label">fa fa-file-picture-o</span></li>
            <li><span class="fa fa-file-powerpoint-o" aria-hidden="true"></span><span class="label">fa fa-file-powerpoint-o</span>
            </li>
            <li><span class="fa fa-file-sound-o" aria-hidden="true"></span><span class="label">fa fa-file-sound-o</span>
            </li>
            <li><span class="fa fa-file-video-o" aria-hidden="true"></span><span class="label">fa fa-file-video-o</span>
            </li>
            <li><span class="fa fa-file-word-o" aria-hidden="true"></span><span class="label">fa fa-file-word-o</span>
            </li>
            <li><span class="fa fa-file-zip-o" aria-hidden="true"></span><span class="label">fa fa-file-zip-o</span>
            </li>
            <li><span class="fa fa-film" aria-hidden="true"></span><span class="label">fa fa-film</span></li>
            <li><span class="fa fa-filter" aria-hidden="true"></span><span class="label">fa fa-filter</span></li>
            <li><span class="fa fa-fire" aria-hidden="true"></span><span class="label">fa fa-fire</span></li>
            <li><span class="fa fa-fire-extinguisher" aria-hidden="true"></span><span class="label">fa fa-fire-extinguisher</span>
            </li>
            <li><span class="fa fa-flag" aria-hidden="true"></span><span class="label">fa fa-flag</span></li>
            <li><span class="fa fa-flag-checkered" aria-hidden="true"></span><span
                    class="label">fa fa-flag-checkered</span></li>
            <li><span class="fa fa-flag-o" aria-hidden="true"></span><span class="label">fa fa-flag-o</span></li>
            <li><span class="fa fa-flash" aria-hidden="true"></span><span class="label">fa fa-flash</span></li>
            <li><span class="fa fa-flask" aria-hidden="true"></span><span class="label">fa fa-flask</span></li>
            <li><span class="fa fa-folder" aria-hidden="true"></span><span class="label">fa fa-folder</span></li>
            <li><span class="fa fa-folder-o" aria-hidden="true"></span><span class="label">fa fa-folder-o</span></li>
            <li><span class="fa fa-folder-open" aria-hidden="true"></span><span class="label">fa fa-folder-open</span>
            </li>
            <li><span class="fa fa-folder-open-o" aria-hidden="true"></span><span
                    class="label">fa fa-folder-open-o</span></li>
            <li><span class="fa fa-frown-o" aria-hidden="true"></span><span class="label">fa fa-frown-o</span></li>
            <li><span class="fa fa-futbol-o" aria-hidden="true"></span><span class="label">fa fa-futbol-o</span></li>
            <li><span class="fa fa-gamepad" aria-hidden="true"></span><span class="label">fa fa-gamepad</span></li>
            <li><span class="fa fa-gavel" aria-hidden="true"></span><span class="label">fa fa-gavel</span></li>
            <li><span class="fa fa-gear" aria-hidden="true"></span><span class="label">fa fa-gear</span></li>
            <li><span class="fa fa-gears" aria-hidden="true"></span><span class="label">fa fa-gears</span></li>
            <li><span class="fa fa-gift" aria-hidden="true"></span><span class="label">fa fa-gift</span></li>
            <li><span class="fa fa-glass" aria-hidden="true"></span><span class="label">fa fa-glass</span></li>
            <li><span class="fa fa-globe" aria-hidden="true"></span><span class="label">fa fa-globe</span></li>
            <li><span class="fa fa-graduation-cap" aria-hidden="true"></span><span
                    class="label">fa fa-graduation-cap</span></li>
            <li><span class="fa fa-group" aria-hidden="true"></span><span class="label">fa fa-group</span></li>
            <li><span class="fa fa-hand-grab-o" aria-hidden="true"></span><span class="label">fa fa-hand-grab-o</span>
            </li>
            <li><span class="fa fa-hand-lizard-o" aria-hidden="true"></span><span
                    class="label">fa fa-hand-lizard-o</span></li>
            <li><span class="fa fa-hand-paper-o" aria-hidden="true"></span><span class="label">fa fa-hand-paper-o</span>
            </li>
            <li><span class="fa fa-hand-peace-o" aria-hidden="true"></span><span class="label">fa fa-hand-peace-o</span>
            </li>
            <li><span class="fa fa-hand-pointer-o" aria-hidden="true"></span><span
                    class="label">fa fa-hand-pointer-o</span></li>
            <li><span class="fa fa-hand-rock-o" aria-hidden="true"></span><span class="label">fa fa-hand-rock-o</span>
            </li>
            <li><span class="fa fa-hand-scissors-o" aria-hidden="true"></span><span
                    class="label">fa fa-hand-scissors-o</span></li>
            <li><span class="fa fa-hand-spock-o" aria-hidden="true"></span><span class="label">fa fa-hand-spock-o</span>
            </li>
            <li><span class="fa fa-hand-stop-o" aria-hidden="true"></span><span class="label">fa fa-hand-stop-o</span>
            </li>
            <li><span class="fa fa-hashtag" aria-hidden="true"></span><span class="label">fa fa-hashtag</span></li>
            <li><span class="fa fa-hdd-o" aria-hidden="true"></span><span class="label">fa fa-hdd-o</span></li>
            <li><span class="fa fa-headphones" aria-hidden="true"></span><span class="label">fa fa-headphones</span>
            </li>
            <li><span class="fa fa-heart" aria-hidden="true"></span><span class="label">fa fa-heart</span></li>
            <li><span class="fa fa-heart-o" aria-hidden="true"></span><span class="label">fa fa-heart-o</span></li>
            <li><span class="fa fa-heartbeat" aria-hidden="true"></span><span class="label">fa fa-heartbeat</span></li>
            <li><span class="fa fa-history" aria-hidden="true"></span><span class="label">fa fa-history</span></li>
            <li><span class="fa fa-home" aria-hidden="true"></span><span class="label">fa fa-home</span></li>
            <li><span class="fa fa-hotel" aria-hidden="true"></span><span class="label">fa fa-hotel</span></li>
            <li><span class="fa fa-hourglass" aria-hidden="true"></span><span class="label">fa fa-hourglass</span></li>
            <li><span class="fa fa-hourglass-1" aria-hidden="true"></span><span class="label">fa fa-hourglass-1</span>
            </li>
            <li><span class="fa fa-hourglass-2" aria-hidden="true"></span><span class="label">fa fa-hourglass-2</span>
            </li>
            <li><span class="fa fa-hourglass-3" aria-hidden="true"></span><span class="label">fa fa-hourglass-3</span>
            </li>
            <li><span class="fa fa-hourglass-end" aria-hidden="true"></span><span
                    class="label">fa fa-hourglass-end</span></li>
            <li><span class="fa fa-hourglass-half" aria-hidden="true"></span><span
                    class="label">fa fa-hourglass-half</span></li>
            <li><span class="fa fa-hourglass-o" aria-hidden="true"></span><span class="label">fa fa-hourglass-o</span>
            </li>
            <li><span class="fa fa-hourglass-start" aria-hidden="true"></span><span
                    class="label">fa fa-hourglass-start</span></li>
            <li><span class="fa fa-i-cursor" aria-hidden="true"></span><span class="label">fa fa-i-cursor</span></li>
            <li><span class="fa fa-image" aria-hidden="true"></span><span class="label">fa fa-image</span></li>
            <li><span class="fa fa-inbox" aria-hidden="true"></span><span class="label">fa fa-inbox</span></li>
            <li><span class="fa fa-industry" aria-hidden="true"></span><span class="label">fa fa-industry</span></li>
            <li><span class="fa fa-info" aria-hidden="true"></span><span class="label">fa fa-info</span></li>
            <li><span class="fa fa-info-circle" aria-hidden="true"></span><span class="label">fa fa-info-circle</span>
            </li>
            <li><span class="fa fa-institution" aria-hidden="true"></span><span class="label">fa fa-institution</span>
            </li>
            <li><span class="fa fa-key" aria-hidden="true"></span><span class="label">fa fa-key</span></li>
            <li><span class="fa fa-keyboard-o" aria-hidden="true"></span><span class="label">fa fa-keyboard-o</span>
            </li>
            <li><span class="fa fa-language" aria-hidden="true"></span><span class="label">fa fa-language</span></li>
            <li><span class="fa fa-laptop" aria-hidden="true"></span><span class="label">fa fa-laptop</span></li>
            <li><span class="fa fa-leaf" aria-hidden="true"></span><span class="label">fa fa-leaf</span></li>
            <li><span class="fa fa-legal" aria-hidden="true"></span><span class="label">fa fa-legal</span></li>
            <li><span class="fa fa-lemon-o" aria-hidden="true"></span><span class="label">fa fa-lemon-o</span></li>
            <li><span class="fa fa-level-down" aria-hidden="true"></span><span class="label">fa fa-level-down</span>
            </li>
            <li><span class="fa fa-level-up" aria-hidden="true"></span><span class="label">fa fa-level-up</span></li>
            <li><span class="fa fa-life-bouy" aria-hidden="true"></span><span class="label">fa fa-life-bouy</span></li>
            <li><span class="fa fa-life-buoy" aria-hidden="true"></span><span class="label">fa fa-life-buoy</span></li>
            <li><span class="fa fa-life-ring" aria-hidden="true"></span><span class="label">fa fa-life-ring</span></li>
            <li><span class="fa fa-life-saver" aria-hidden="true"></span><span class="label">fa fa-life-saver</span>
            </li>
            <li><span class="fa fa-lightbulb-o" aria-hidden="true"></span><span class="label">fa fa-lightbulb-o</span>
            </li>
            <li><span class="fa fa-line-chart" aria-hidden="true"></span><span class="label">fa fa-line-chart</span>
            </li>
            <li><span class="fa fa-location-arrow" aria-hidden="true"></span><span
                    class="label">fa fa-location-arrow</span></li>
            <li><span class="fa fa-lock" aria-hidden="true"></span><span class="label">fa fa-lock</span></li>
            <li><span class="fa fa-magic" aria-hidden="true"></span><span class="label">fa fa-magic</span></li>
            <li><span class="fa fa-magnet" aria-hidden="true"></span><span class="label">fa fa-magnet</span></li>
            <li><span class="fa fa-mail-forward" aria-hidden="true"></span><span class="label">fa fa-mail-forward</span>
            </li>
            <li><span class="fa fa-mail-reply" aria-hidden="true"></span><span class="label">fa fa-mail-reply</span>
            </li>
            <li><span class="fa fa-mail-reply-all" aria-hidden="true"></span><span
                    class="label">fa fa-mail-reply-all</span></li>
            <li><span class="fa fa-male" aria-hidden="true"></span><span class="label">fa fa-male</span></li>
            <li><span class="fa fa-map" aria-hidden="true"></span><span class="label">fa fa-map</span></li>
            <li><span class="fa fa-map-marker" aria-hidden="true"></span><span class="label">fa fa-map-marker</span>
            </li>
            <li><span class="fa fa-map-o" aria-hidden="true"></span><span class="label">fa fa-map-o</span></li>
            <li><span class="fa fa-map-pin" aria-hidden="true"></span><span class="label">fa fa-map-pin</span></li>
            <li><span class="fa fa-map-signs" aria-hidden="true"></span><span class="label">fa fa-map-signs</span></li>
            <li><span class="fa fa-meh-o" aria-hidden="true"></span><span class="label">fa fa-meh-o</span></li>
            <li><span class="fa fa-microphone" aria-hidden="true"></span><span class="label">fa fa-microphone</span>
            </li>
            <li><span class="fa fa-microphone-slash" aria-hidden="true"></span><span class="label">fa fa-microphone-slash</span>
            </li>
            <li><span class="fa fa-minus" aria-hidden="true"></span><span class="label">fa fa-minus</span></li>
            <li><span class="fa fa-minus-circle" aria-hidden="true"></span><span class="label">fa fa-minus-circle</span>
            </li>
            <li><span class="fa fa-minus-square" aria-hidden="true"></span><span class="label">fa fa-minus-square</span>
            </li>
            <li><span class="fa fa-minus-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-minus-square-o</span></li>
            <li><span class="fa fa-mobile" aria-hidden="true"></span><span class="label">fa fa-mobile</span></li>
            <li><span class="fa fa-mobile-phone" aria-hidden="true"></span><span class="label">fa fa-mobile-phone</span>
            </li>
            <li><span class="fa fa-money" aria-hidden="true"></span><span class="label">fa fa-money</span></li>
            <li><span class="fa fa-moon-o" aria-hidden="true"></span><span class="label">fa fa-moon-o</span></li>
            <li><span class="fa fa-mortar-board" aria-hidden="true"></span><span class="label">fa fa-mortar-board</span>
            </li>
            <li><span class="fa fa-motorcycle" aria-hidden="true"></span><span class="label">fa fa-motorcycle</span>
            </li>
            <li><span class="fa fa-mouse-pointer" aria-hidden="true"></span><span
                    class="label">fa fa-mouse-pointer</span></li>
            <li><span class="fa fa-music" aria-hidden="true"></span><span class="label">fa fa-music</span></li>
            <li><span class="fa fa-navicon" aria-hidden="true"></span><span class="label">fa fa-navicon</span></li>
            <li><span class="fa fa-newspaper-o" aria-hidden="true"></span><span class="label">fa fa-newspaper-o</span>
            </li>
            <li><span class="fa fa-object-group" aria-hidden="true"></span><span class="label">fa fa-object-group</span>
            </li>
            <li><span class="fa fa-object-ungroup" aria-hidden="true"></span><span
                    class="label">fa fa-object-ungroup</span></li>
            <li><span class="fa fa-paint-brush" aria-hidden="true"></span><span class="label">fa fa-paint-brush</span>
            </li>
            <li><span class="fa fa-paper-plane" aria-hidden="true"></span><span class="label">fa fa-paper-plane</span>
            </li>
            <li><span class="fa fa-paper-plane-o" aria-hidden="true"></span><span
                    class="label">fa fa-paper-plane-o</span></li>
            <li><span class="fa fa-paw" aria-hidden="true"></span><span class="label">fa fa-paw</span></li>
            <li><span class="fa fa-pencil" aria-hidden="true"></span><span class="label">fa fa-pencil</span></li>
            <li><span class="fa fa-pencil-square" aria-hidden="true"></span><span
                    class="label">fa fa-pencil-square</span></li>
            <li><span class="fa fa-pencil-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-pencil-square-o</span></li>
            <li><span class="fa fa-percent" aria-hidden="true"></span><span class="label">fa fa-percent</span></li>
            <li><span class="fa fa-phone" aria-hidden="true"></span><span class="label">fa fa-phone</span></li>
            <li><span class="fa fa-phone-square" aria-hidden="true"></span><span class="label">fa fa-phone-square</span>
            </li>
            <li><span class="fa fa-photo" aria-hidden="true"></span><span class="label">fa fa-photo</span></li>
            <li><span class="fa fa-picture-o" aria-hidden="true"></span><span class="label">fa fa-picture-o</span></li>
            <li><span class="fa fa-pie-chart" aria-hidden="true"></span><span class="label">fa fa-pie-chart</span></li>
            <li><span class="fa fa-plane" aria-hidden="true"></span><span class="label">fa fa-plane</span></li>
            <li><span class="fa fa-plug" aria-hidden="true"></span><span class="label">fa fa-plug</span></li>
            <li><span class="fa fa-plus" aria-hidden="true"></span><span class="label">fa fa-plus</span></li>
            <li><span class="fa fa-plus-circle" aria-hidden="true"></span><span class="label">fa fa-plus-circle</span>
            </li>
            <li><span class="fa fa-plus-square" aria-hidden="true"></span><span class="label">fa fa-plus-square</span>
            </li>
            <li><span class="fa fa-plus-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-plus-square-o</span></li>
            <li><span class="fa fa-power-off" aria-hidden="true"></span><span class="label">fa fa-power-off</span></li>
            <li><span class="fa fa-print" aria-hidden="true"></span><span class="label">fa fa-print</span></li>
            <li><span class="fa fa-puzzle-piece" aria-hidden="true"></span><span class="label">fa fa-puzzle-piece</span>
            </li>
            <li><span class="fa fa-qrcode" aria-hidden="true"></span><span class="label">fa fa-qrcode</span></li>
            <li><span class="fa fa-question" aria-hidden="true"></span><span class="label">fa fa-question</span></li>
            <li><span class="fa fa-question-circle" aria-hidden="true"></span><span
                    class="label">fa fa-question-circle</span></li>
            <li><span class="fa fa-quote-left" aria-hidden="true"></span><span class="label">fa fa-quote-left</span>
            </li>
            <li><span class="fa fa-quote-right" aria-hidden="true"></span><span class="label">fa fa-quote-right</span>
            </li>
            <li><span class="fa fa-random" aria-hidden="true"></span><span class="label">fa fa-random</span></li>
            <li><span class="fa fa-recycle" aria-hidden="true"></span><span class="label">fa fa-recycle</span></li>
            <li><span class="fa fa-refresh" aria-hidden="true"></span><span class="label">fa fa-refresh</span></li>
            <li><span class="fa fa-registered" aria-hidden="true"></span><span class="label">fa fa-registered</span>
            </li>
            <li><span class="fa fa-remove" aria-hidden="true"></span><span class="label">fa fa-remove</span></li>
            <li><span class="fa fa-reorder" aria-hidden="true"></span><span class="label">fa fa-reorder</span></li>
            <li><span class="fa fa-reply" aria-hidden="true"></span><span class="label">fa fa-reply</span></li>
            <li><span class="fa fa-reply-all" aria-hidden="true"></span><span class="label">fa fa-reply-all</span></li>
            <li><span class="fa fa-retweet" aria-hidden="true"></span><span class="label">fa fa-retweet</span></li>
            <li><span class="fa fa-road" aria-hidden="true"></span><span class="label">fa fa-road</span></li>
            <li><span class="fa fa-rocket" aria-hidden="true"></span><span class="label">fa fa-rocket</span></li>
            <li><span class="fa fa-rss" aria-hidden="true"></span><span class="label">fa fa-rss</span></li>
            <li><span class="fa fa-rss-square" aria-hidden="true"></span><span class="label">fa fa-rss-square</span>
            </li>
            <li><span class="fa fa-search" aria-hidden="true"></span><span class="label">fa fa-search</span></li>
            <li><span class="fa fa-search-minus" aria-hidden="true"></span><span class="label">fa fa-search-minus</span>
            </li>
            <li><span class="fa fa-search-plus" aria-hidden="true"></span><span class="label">fa fa-search-plus</span>
            </li>
            <li><span class="fa fa-send" aria-hidden="true"></span><span class="label">fa fa-send</span></li>
            <li><span class="fa fa-send-o" aria-hidden="true"></span><span class="label">fa fa-send-o</span></li>
            <li><span class="fa fa-server" aria-hidden="true"></span><span class="label">fa fa-server</span></li>
            <li><span class="fa fa-share" aria-hidden="true"></span><span class="label">fa fa-share</span></li>
            <li><span class="fa fa-share-alt" aria-hidden="true"></span><span class="label">fa fa-share-alt</span></li>
            <li><span class="fa fa-share-alt-square" aria-hidden="true"></span><span class="label">fa fa-share-alt-square</span>
            </li>
            <li><span class="fa fa-share-square" aria-hidden="true"></span><span class="label">fa fa-share-square</span>
            </li>
            <li><span class="fa fa-share-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-share-square-o</span></li>
            <li><span class="fa fa-shield" aria-hidden="true"></span><span class="label">fa fa-shield</span></li>
            <li><span class="fa fa-ship" aria-hidden="true"></span><span class="label">fa fa-ship</span></li>
            <li><span class="fa fa-shopping-bag" aria-hidden="true"></span><span class="label">fa fa-shopping-bag</span>
            </li>
            <li><span class="fa fa-shopping-basket" aria-hidden="true"></span><span
                    class="label">fa fa-shopping-basket</span></li>
            <li><span class="fa fa-shopping-cart" aria-hidden="true"></span><span
                    class="label">fa fa-shopping-cart</span></li>
            <li><span class="fa fa-sign-in" aria-hidden="true"></span><span class="label">fa fa-sign-in</span></li>
            <li><span class="fa fa-sign-out" aria-hidden="true"></span><span class="label">fa fa-sign-out</span></li>
            <li><span class="fa fa-signal" aria-hidden="true"></span><span class="label">fa fa-signal</span></li>
            <li><span class="fa fa-sitemap" aria-hidden="true"></span><span class="label">fa fa-sitemap</span></li>
            <li><span class="fa fa-sliders" aria-hidden="true"></span><span class="label">fa fa-sliders</span></li>
            <li><span class="fa fa-smile-o" aria-hidden="true"></span><span class="label">fa fa-smile-o</span></li>
            <li><span class="fa fa-soccer-ball-o" aria-hidden="true"></span><span
                    class="label">fa fa-soccer-ball-o</span></li>
            <li><span class="fa fa-sort" aria-hidden="true"></span><span class="label">fa fa-sort</span></li>
            <li><span class="fa fa-sort-alpha-asc" aria-hidden="true"></span><span
                    class="label">fa fa-sort-alpha-asc</span></li>
            <li><span class="fa fa-sort-alpha-desc" aria-hidden="true"></span><span
                    class="label">fa fa-sort-alpha-desc</span></li>
            <li><span class="fa fa-sort-amount-asc" aria-hidden="true"></span><span
                    class="label">fa fa-sort-amount-asc</span></li>
            <li><span class="fa fa-sort-amount-desc" aria-hidden="true"></span><span class="label">fa fa-sort-amount-desc</span>
            </li>
            <li><span class="fa fa-sort-asc" aria-hidden="true"></span><span class="label">fa fa-sort-asc</span></li>
            <li><span class="fa fa-sort-desc" aria-hidden="true"></span><span class="label">fa fa-sort-desc</span></li>
            <li><span class="fa fa-sort-down" aria-hidden="true"></span><span class="label">fa fa-sort-down</span></li>
            <li><span class="fa fa-sort-numeric-asc" aria-hidden="true"></span><span class="label">fa fa-sort-numeric-asc</span>
            </li>
            <li><span class="fa fa-sort-numeric-desc" aria-hidden="true"></span><span class="label">fa fa-sort-numeric-desc</span>
            </li>
            <li><span class="fa fa-sort-up" aria-hidden="true"></span><span class="label">fa fa-sort-up</span></li>
            <li><span class="fa fa-space-shuttle" aria-hidden="true"></span><span
                    class="label">fa fa-space-shuttle</span></li>
            <li><span class="fa fa-spoon" aria-hidden="true"></span><span class="label">fa fa-spoon</span></li>
            <li><span class="fa fa-square" aria-hidden="true"></span><span class="label">fa fa-square</span></li>
            <li><span class="fa fa-square-o" aria-hidden="true"></span><span class="label">fa fa-square-o</span></li>
            <li><span class="fa fa-star" aria-hidden="true"></span><span class="label">fa fa-star</span></li>
            <li><span class="fa fa-star-half" aria-hidden="true"></span><span class="label">fa fa-star-half</span></li>
            <li><span class="fa fa-star-half-empty" aria-hidden="true"></span><span
                    class="label">fa fa-star-half-empty</span></li>
            <li><span class="fa fa-star-half-full" aria-hidden="true"></span><span
                    class="label">fa fa-star-half-full</span></li>
            <li><span class="fa fa-star-half-o" aria-hidden="true"></span><span class="label">fa fa-star-half-o</span>
            </li>
            <li><span class="fa fa-star-o" aria-hidden="true"></span><span class="label">fa fa-star-o</span></li>
            <li><span class="fa fa-sticky-note" aria-hidden="true"></span><span class="label">fa fa-sticky-note</span>
            </li>
            <li><span class="fa fa-sticky-note-o" aria-hidden="true"></span><span
                    class="label">fa fa-sticky-note-o</span></li>
            <li><span class="fa fa-street-view" aria-hidden="true"></span><span class="label">fa fa-street-view</span>
            </li>
            <li><span class="fa fa-suitcase" aria-hidden="true"></span><span class="label">fa fa-suitcase</span></li>
            <li><span class="fa fa-sun-o" aria-hidden="true"></span><span class="label">fa fa-sun-o</span></li>
            <li><span class="fa fa-support" aria-hidden="true"></span><span class="label">fa fa-support</span></li>
            <li><span class="fa fa-tablet" aria-hidden="true"></span><span class="label">fa fa-tablet</span></li>
            <li><span class="fa fa-tachometer" aria-hidden="true"></span><span class="label">fa fa-tachometer</span>
            </li>
            <li><span class="fa fa-tag" aria-hidden="true"></span><span class="label">fa fa-tag</span></li>
            <li><span class="fa fa-tags" aria-hidden="true"></span><span class="label">fa fa-tags</span></li>
            <li><span class="fa fa-tasks" aria-hidden="true"></span><span class="label">fa fa-tasks</span></li>
            <li><span class="fa fa-taxi" aria-hidden="true"></span><span class="label">fa fa-taxi</span></li>
            <li><span class="fa fa-television" aria-hidden="true"></span><span class="label">fa fa-television</span>
            </li>
            <li><span class="fa fa-terminal" aria-hidden="true"></span><span class="label">fa fa-terminal</span></li>
            <li><span class="fa fa-thumb-tack" aria-hidden="true"></span><span class="label">fa fa-thumb-tack</span>
            </li>
            <li><span class="fa fa-thumbs-down" aria-hidden="true"></span><span class="label">fa fa-thumbs-down</span>
            </li>
            <li><span class="fa fa-thumbs-o-down" aria-hidden="true"></span><span
                    class="label">fa fa-thumbs-o-down</span></li>
            <li><span class="fa fa-thumbs-o-up" aria-hidden="true"></span><span class="label">fa fa-thumbs-o-up</span>
            </li>
            <li><span class="fa fa-thumbs-up" aria-hidden="true"></span><span class="label">fa fa-thumbs-up</span></li>
            <li><span class="fa fa-ticket" aria-hidden="true"></span><span class="label">fa fa-ticket</span></li>
            <li><span class="fa fa-times" aria-hidden="true"></span><span class="label">fa fa-times</span></li>
            <li><span class="fa fa-times-circle" aria-hidden="true"></span><span class="label">fa fa-times-circle</span>
            </li>
            <li><span class="fa fa-times-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-times-circle-o</span></li>
            <li><span class="fa fa-tint" aria-hidden="true"></span><span class="label">fa fa-tint</span></li>
            <li><span class="fa fa-toggle-down" aria-hidden="true"></span><span class="label">fa fa-toggle-down</span>
            </li>
            <li><span class="fa fa-toggle-left" aria-hidden="true"></span><span class="label">fa fa-toggle-left</span>
            </li>
            <li><span class="fa fa-toggle-off" aria-hidden="true"></span><span class="label">fa fa-toggle-off</span>
            </li>
            <li><span class="fa fa-toggle-on" aria-hidden="true"></span><span class="label">fa fa-toggle-on</span></li>
            <li><span class="fa fa-toggle-right" aria-hidden="true"></span><span class="label">fa fa-toggle-right</span>
            </li>
            <li><span class="fa fa-toggle-up" aria-hidden="true"></span><span class="label">fa fa-toggle-up</span></li>
            <li><span class="fa fa-trademark" aria-hidden="true"></span><span class="label">fa fa-trademark</span></li>
            <li><span class="fa fa-trash" aria-hidden="true"></span><span class="label">fa fa-trash</span></li>
            <li><span class="fa fa-trash-o" aria-hidden="true"></span><span class="label">fa fa-trash-o</span></li>
            <li><span class="fa fa-tree" aria-hidden="true"></span><span class="label">fa fa-tree</span></li>
            <li><span class="fa fa-trophy" aria-hidden="true"></span><span class="label">fa fa-trophy</span></li>
            <li><span class="fa fa-truck" aria-hidden="true"></span><span class="label">fa fa-truck</span></li>
            <li><span class="fa fa-tty" aria-hidden="true"></span><span class="label">fa fa-tty</span></li>
            <li><span class="fa fa-tv" aria-hidden="true"></span><span class="label">fa fa-tv</span></li>
            <li><span class="fa fa-umbrella" aria-hidden="true"></span><span class="label">fa fa-umbrella</span></li>
            <li><span class="fa fa-university" aria-hidden="true"></span><span class="label">fa fa-university</span>
            </li>
            <li><span class="fa fa-unlock" aria-hidden="true"></span><span class="label">fa fa-unlock</span></li>
            <li><span class="fa fa-unlock-alt" aria-hidden="true"></span><span class="label">fa fa-unlock-alt</span>
            </li>
            <li><span class="fa fa-unsorted" aria-hidden="true"></span><span class="label">fa fa-unsorted</span></li>
            <li><span class="fa fa-upload" aria-hidden="true"></span><span class="label">fa fa-upload</span></li>
            <li><span class="fa fa-user" aria-hidden="true"></span><span class="label">fa fa-user</span></li>
            <li><span class="fa fa-user-plus" aria-hidden="true"></span><span class="label">fa fa-user-plus</span></li>
            <li><span class="fa fa-user-secret" aria-hidden="true"></span><span class="label">fa fa-user-secret</span>
            </li>
            <li><span class="fa fa-user-times" aria-hidden="true"></span><span class="label">fa fa-user-times</span>
            </li>
            <li><span class="fa fa-users" aria-hidden="true"></span><span class="label">fa fa-users</span></li>
            <li><span class="fa fa-video-camera" aria-hidden="true"></span><span class="label">fa fa-video-camera</span>
            </li>
            <li><span class="fa fa-volume-down" aria-hidden="true"></span><span class="label">fa fa-volume-down</span>
            </li>
            <li><span class="fa fa-volume-off" aria-hidden="true"></span><span class="label">fa fa-volume-off</span>
            </li>
            <li><span class="fa fa-volume-up" aria-hidden="true"></span><span class="label">fa fa-volume-up</span></li>
            <li><span class="fa fa-warning" aria-hidden="true"></span><span class="label">fa fa-warning</span></li>
            <li><span class="fa fa-wheelchair" aria-hidden="true"></span><span class="label">fa fa-wheelchair</span>
            </li>
            <li><span class="fa fa-wifi" aria-hidden="true"></span><span class="label">fa fa-wifi</span></li>
            <li><span class="fa fa-wrench" aria-hidden="true"></span><span class="label">fa fa-wrench</span></li>
            <li><span class="fa fa-hand-grab-o" aria-hidden="true"></span><span class="label">fa fa-hand-grab-o</span>
            </li>
            <li><span class="fa fa-hand-lizard-o" aria-hidden="true"></span><span
                    class="label">fa fa-hand-lizard-o</span></li>
            <li><span class="fa fa-hand-o-down" aria-hidden="true"></span><span class="label">fa fa-hand-o-down</span>
            </li>
            <li><span class="fa fa-hand-o-left" aria-hidden="true"></span><span class="label">fa fa-hand-o-left</span>
            </li>
            <li><span class="fa fa-hand-o-right" aria-hidden="true"></span><span class="label">fa fa-hand-o-right</span>
            </li>
            <li><span class="fa fa-hand-o-up" aria-hidden="true"></span><span class="label">fa fa-hand-o-up</span></li>
            <li><span class="fa fa-hand-paper-o" aria-hidden="true"></span><span class="label">fa fa-hand-paper-o</span>
            </li>
            <li><span class="fa fa-hand-peace-o" aria-hidden="true"></span><span class="label">fa fa-hand-peace-o</span>
            </li>
            <li><span class="fa fa-hand-pointer-o" aria-hidden="true"></span><span
                    class="label">fa fa-hand-pointer-o</span></li>
            <li><span class="fa fa-hand-rock-o" aria-hidden="true"></span><span class="label">fa fa-hand-rock-o</span>
            </li>
            <li><span class="fa fa-hand-scissors-o" aria-hidden="true"></span><span
                    class="label">fa fa-hand-scissors-o</span></li>
            <li><span class="fa fa-hand-spock-o" aria-hidden="true"></span><span class="label">fa fa-hand-spock-o</span>
            </li>
            <li><span class="fa fa-hand-stop-o" aria-hidden="true"></span><span class="label">fa fa-hand-stop-o</span>
            </li>
            <li><span class="fa fa-thumbs-down" aria-hidden="true"></span><span class="label">fa fa-thumbs-down</span>
            </li>
            <li><span class="fa fa-thumbs-o-down" aria-hidden="true"></span><span
                    class="label">fa fa-thumbs-o-down</span></li>
            <li><span class="fa fa-thumbs-o-up" aria-hidden="true"></span><span class="label">fa fa-thumbs-o-up</span>
            </li>
            <li><span class="fa fa-thumbs-up" aria-hidden="true"></span><span class="label">fa fa-thumbs-up</span></li>
            <li><span class="fa fa-ambulance" aria-hidden="true"></span><span class="label">fa fa-ambulance</span></li>
            <li><span class="fa fa-automobile" aria-hidden="true"></span><span class="label">fa fa-automobile</span>
            </li>
            <li><span class="fa fa-bicycle" aria-hidden="true"></span><span class="label">fa fa-bicycle</span></li>
            <li><span class="fa fa-bus" aria-hidden="true"></span><span class="label">fa fa-bus</span></li>
            <li><span class="fa fa-cab" aria-hidden="true"></span><span class="label">fa fa-cab</span></li>
            <li><span class="fa fa-car" aria-hidden="true"></span><span class="label">fa fa-car</span></li>
            <li><span class="fa fa-fighter-jet" aria-hidden="true"></span><span class="label">fa fa-fighter-jet</span>
            </li>
            <li><span class="fa fa-motorcycle" aria-hidden="true"></span><span class="label">fa fa-motorcycle</span>
            </li>
            <li><span class="fa fa-plane" aria-hidden="true"></span><span class="label">fa fa-plane</span></li>
            <li><span class="fa fa-rocket" aria-hidden="true"></span><span class="label">fa fa-rocket</span></li>
            <li><span class="fa fa-ship" aria-hidden="true"></span><span class="label">fa fa-ship</span></li>
            <li><span class="fa fa-space-shuttle" aria-hidden="true"></span><span
                    class="label">fa fa-space-shuttle</span></li>
            <li><span class="fa fa-subway" aria-hidden="true"></span><span class="label">fa fa-subway</span></li>
            <li><span class="fa fa-taxi" aria-hidden="true"></span><span class="label">fa fa-taxi</span></li>
            <li><span class="fa fa-train" aria-hidden="true"></span><span class="label">fa fa-train</span></li>
            <li><span class="fa fa-truck" aria-hidden="true"></span><span class="label">fa fa-truck</span></li>
            <li><span class="fa fa-wheelchair" aria-hidden="true"></span><span class="label">fa fa-wheelchair</span>
            </li>
            <li><span class="fa fa-genderless" aria-hidden="true"></span><span class="label">fa fa-genderless</span>
            </li>
            <li><span class="fa fa-intersex" aria-hidden="true"></span><span class="label">fa fa-intersex</span></li>
            <li><span class="fa fa-mars" aria-hidden="true"></span><span class="label">fa fa-mars</span></li>
            <li><span class="fa fa-mars-double" aria-hidden="true"></span><span class="label">fa fa-mars-double</span>
            </li>
            <li><span class="fa fa-mars-stroke" aria-hidden="true"></span><span class="label">fa fa-mars-stroke</span>
            </li>
            <li><span class="fa fa-mars-stroke-h" aria-hidden="true"></span><span
                    class="label">fa fa-mars-stroke-h</span></li>
            <li><span class="fa fa-mars-stroke-v" aria-hidden="true"></span><span
                    class="label">fa fa-mars-stroke-v</span></li>
            <li><span class="fa fa-mercury" aria-hidden="true"></span><span class="label">fa fa-mercury</span></li>
            <li><span class="fa fa-neuter" aria-hidden="true"></span><span class="label">fa fa-neuter</span></li>
            <li><span class="fa fa-transgender" aria-hidden="true"></span><span class="label">fa fa-transgender</span>
            </li>
            <li><span class="fa fa-transgender-alt" aria-hidden="true"></span><span
                    class="label">fa fa-transgender-alt</span></li>
            <li><span class="fa fa-venus" aria-hidden="true"></span><span class="label">fa fa-venus</span></li>
            <li><span class="fa fa-venus-double" aria-hidden="true"></span><span class="label">fa fa-venus-double</span>
            </li>
            <li><span class="fa fa-venus-mars" aria-hidden="true"></span><span class="label">fa fa-venus-mars</span>
            </li>
            <li><span class="fa fa-file" aria-hidden="true"></span><span class="label">fa fa-file</span></li>
            <li><span class="fa fa-file-archive-o" aria-hidden="true"></span><span
                    class="label">fa fa-file-archive-o</span></li>
            <li><span class="fa fa-file-audio-o" aria-hidden="true"></span><span class="label">fa fa-file-audio-o</span>
            </li>
            <li><span class="fa fa-file-code-o" aria-hidden="true"></span><span class="label">fa fa-file-code-o</span>
            </li>
            <li><span class="fa fa-file-excel-o" aria-hidden="true"></span><span class="label">fa fa-file-excel-o</span>
            </li>
            <li><span class="fa fa-file-image-o" aria-hidden="true"></span><span class="label">fa fa-file-image-o</span>
            </li>
            <li><span class="fa fa-file-movie-o" aria-hidden="true"></span><span class="label">fa fa-file-movie-o</span>
            </li>
            <li><span class="fa fa-file-o" aria-hidden="true"></span><span class="label">fa fa-file-o</span></li>
            <li><span class="fa fa-file-pdf-o" aria-hidden="true"></span><span class="label">fa fa-file-pdf-o</span>
            </li>
            <li><span class="fa fa-file-photo-o" aria-hidden="true"></span><span class="label">fa fa-file-photo-o</span>
            </li>
            <li><span class="fa fa-file-picture-o" aria-hidden="true"></span><span
                    class="label">fa fa-file-picture-o</span></li>
            <li><span class="fa fa-file-powerpoint-o" aria-hidden="true"></span><span class="label">fa fa-file-powerpoint-o</span>
            </li>
            <li><span class="fa fa-file-sound-o" aria-hidden="true"></span><span class="label">fa fa-file-sound-o</span>
            </li>
            <li><span class="fa fa-file-text" aria-hidden="true"></span><span class="label">fa fa-file-text</span></li>
            <li><span class="fa fa-file-text-o" aria-hidden="true"></span><span class="label">fa fa-file-text-o</span>
            </li>
            <li><span class="fa fa-file-video-o" aria-hidden="true"></span><span class="label">fa fa-file-video-o</span>
            </li>
            <li><span class="fa fa-file-word-o" aria-hidden="true"></span><span class="label">fa fa-file-word-o</span>
            </li>
            <li><span class="fa fa-file-zip-o" aria-hidden="true"></span><span class="label">fa fa-file-zip-o</span>
            </li>
            <li><span class="fa fa-circle-o-notch" aria-hidden="true"></span><span
                    class="label">fa fa-circle-o-notch</span></li>
            <li><span class="fa fa-cog" aria-hidden="true"></span><span class="label">fa fa-cog</span></li>
            <li><span class="fa fa-gear" aria-hidden="true"></span><span class="label">fa fa-gear</span></li>
            <li><span class="fa fa-refresh" aria-hidden="true"></span><span class="label">fa fa-refresh</span></li>
            <li><span class="fa fa-check-square" aria-hidden="true"></span><span class="label">fa fa-check-square</span>
            </li>
            <li><span class="fa fa-check-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-check-square-o</span></li>
            <li><span class="fa fa-circle" aria-hidden="true"></span><span class="label">fa fa-circle</span></li>
            <li><span class="fa fa-circle-o" aria-hidden="true"></span><span class="label">fa fa-circle-o</span></li>
            <li><span class="fa fa-dot-circle-o" aria-hidden="true"></span><span class="label">fa fa-dot-circle-o</span>
            </li>
            <li><span class="fa fa-minus-square" aria-hidden="true"></span><span class="label">fa fa-minus-square</span>
            </li>
            <li><span class="fa fa-minus-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-minus-square-o</span></li>
            <li><span class="fa fa-plus-square" aria-hidden="true"></span><span class="label">fa fa-plus-square</span>
            </li>
            <li><span class="fa fa-plus-square-o" aria-hidden="true"></span><span
                    class="label">fa fa-plus-square-o</span></li>
            <li><span class="fa fa-square" aria-hidden="true"></span><span class="label">fa fa-square</span></li>
            <li><span class="fa fa-square-o" aria-hidden="true"></span><span class="label">fa fa-square-o</span></li>
            <li><span class="fa fa-cc-amex" aria-hidden="true"></span><span class="label">fa fa-cc-amex</span></li>
            <li><span class="fa fa-cc-diners-club" aria-hidden="true"></span><span
                    class="label">fa fa-cc-diners-club</span></li>
            <li><span class="fa fa-cc-discover" aria-hidden="true"></span><span class="label">fa fa-cc-discover</span>
            </li>
            <li><span class="fa fa-cc-jcb" aria-hidden="true"></span><span class="label">fa fa-cc-jcb</span></li>
            <li><span class="fa fa-cc-mastercard" aria-hidden="true"></span><span
                    class="label">fa fa-cc-mastercard</span></li>
            <li><span class="fa fa-cc-paypal" aria-hidden="true"></span><span class="label">fa fa-cc-paypal</span></li>
            <li><span class="fa fa-cc-stripe" aria-hidden="true"></span><span class="label">fa fa-cc-stripe</span></li>
            <li><span class="fa fa-cc-visa" aria-hidden="true"></span><span class="label">fa fa-cc-visa</span></li>
            <li><span class="fa fa-credit-card" aria-hidden="true"></span><span class="label">fa fa-credit-card</span>
            </li>
            <li><span class="fa fa-credit-card-alt" aria-hidden="true"></span><span
                    class="label">fa fa-credit-card-alt</span></li>
            <li><span class="fa fa-google-wallet" aria-hidden="true"></span><span
                    class="label">fa fa-google-wallet</span></li>
            <li><span class="fa fa-paypal" aria-hidden="true"></span><span class="label">fa fa-paypal</span></li>
            <li><span class="fa fa-area-chart" aria-hidden="true"></span><span class="label">fa fa-area-chart</span>
            </li>
            <li><span class="fa fa-bar-chart" aria-hidden="true"></span><span class="label">fa fa-bar-chart</span></li>
            <li><span class="fa fa-bar-chart-o" aria-hidden="true"></span><span class="label">fa fa-bar-chart-o</span>
            </li>
            <li><span class="fa fa-line-chart" aria-hidden="true"></span><span class="label">fa fa-line-chart</span>
            </li>
            <li><span class="fa fa-pie-chart" aria-hidden="true"></span><span class="label">fa fa-pie-chart</span></li>
            <li><span class="fa fa-bitcoin" aria-hidden="true"></span><span class="label">fa fa-bitcoin</span></li>
            <li><span class="fa fa-btc" aria-hidden="true"></span><span class="label">fa fa-btc</span></li>
            <li><span class="fa fa-cny" aria-hidden="true"></span><span class="label">fa fa-cny</span></li>
            <li><span class="fa fa-dollar" aria-hidden="true"></span><span class="label">fa fa-dollar</span></li>
            <li><span class="fa fa-eur" aria-hidden="true"></span><span class="label">fa fa-eur</span></li>
            <li><span class="fa fa-euro" aria-hidden="true"></span><span class="label">fa fa-euro</span></li>
            <li><span class="fa fa-gbp" aria-hidden="true"></span><span class="label">fa fa-gbp</span></li>
            <li><span class="fa fa-gg" aria-hidden="true"></span><span class="label">fa fa-gg</span></li>
            <li><span class="fa fa-gg-circle" aria-hidden="true"></span><span class="label">fa fa-gg-circle</span></li>
            <li><span class="fa fa-ils" aria-hidden="true"></span><span class="label">fa fa-ils</span></li>
            <li><span class="fa fa-inr" aria-hidden="true"></span><span class="label">fa fa-inr</span></li>
            <li><span class="fa fa-jpy" aria-hidden="true"></span><span class="label">fa fa-jpy</span></li>
            <li><span class="fa fa-krw" aria-hidden="true"></span><span class="label">fa fa-krw</span></li>
            <li><span class="fa fa-money" aria-hidden="true"></span><span class="label">fa fa-money</span></li>
            <li><span class="fa fa-rmb" aria-hidden="true"></span><span class="label">fa fa-rmb</span></li>
            <li><span class="fa fa-rouble" aria-hidden="true"></span><span class="label">fa fa-rouble</span></li>
            <li><span class="fa fa-rub" aria-hidden="true"></span><span class="label">fa fa-rub</span></li>
            <li><span class="fa fa-ruble" aria-hidden="true"></span><span class="label">fa fa-ruble</span></li>
            <li><span class="fa fa-rupee" aria-hidden="true"></span><span class="label">fa fa-rupee</span></li>
            <li><span class="fa fa-shekel" aria-hidden="true"></span><span class="label">fa fa-shekel</span></li>
            <li><span class="fa fa-sheqel" aria-hidden="true"></span><span class="label">fa fa-sheqel</span></li>
            <li><span class="fa fa-try" aria-hidden="true"></span><span class="label">fa fa-try</span></li>
            <li><span class="fa fa-turkish-lira" aria-hidden="true"></span><span class="label">fa fa-turkish-lira</span>
            </li>
            <li><span class="fa fa-usd" aria-hidden="true"></span><span class="label">fa fa-usd</span></li>
            <li><span class="fa fa-won" aria-hidden="true"></span><span class="label">fa fa-won</span></li>
            <li><span class="fa fa-yen" aria-hidden="true"></span><span class="label">fa fa-yen</span></li>
            <li><span class="fa fa-align-center" aria-hidden="true"></span><span class="label">fa fa-align-center</span>
            </li>
            <li><span class="fa fa-align-justify" aria-hidden="true"></span><span
                    class="label">fa fa-align-justify</span></li>
            <li><span class="fa fa-align-left" aria-hidden="true"></span><span class="label">fa fa-align-left</span>
            </li>
            <li><span class="fa fa-align-right" aria-hidden="true"></span><span class="label">fa fa-align-right</span>
            </li>
            <li><span class="fa fa-bold" aria-hidden="true"></span><span class="label">fa fa-bold</span></li>
            <li><span class="fa fa-chain" aria-hidden="true"></span><span class="label">fa fa-chain</span></li>
            <li><span class="fa fa-chain-broken" aria-hidden="true"></span><span class="label">fa fa-chain-broken</span>
            </li>
            <li><span class="fa fa-clipboard" aria-hidden="true"></span><span class="label">fa fa-clipboard</span></li>
            <li><span class="fa fa-columns" aria-hidden="true"></span><span class="label">fa fa-columns</span></li>
            <li><span class="fa fa-copy" aria-hidden="true"></span><span class="label">fa fa-copy</span></li>
            <li><span class="fa fa-cut" aria-hidden="true"></span><span class="label">fa fa-cut</span></li>
            <li><span class="fa fa-dedent" aria-hidden="true"></span><span class="label">fa fa-dedent</span></li>
            <li><span class="fa fa-eraser" aria-hidden="true"></span><span class="label">fa fa-eraser</span></li>
            <li><span class="fa fa-file" aria-hidden="true"></span><span class="label">fa fa-file</span></li>
            <li><span class="fa fa-file-o" aria-hidden="true"></span><span class="label">fa fa-file-o</span></li>
            <li><span class="fa fa-file-text" aria-hidden="true"></span><span class="label">fa fa-file-text</span></li>
            <li><span class="fa fa-file-text-o" aria-hidden="true"></span><span class="label">fa fa-file-text-o</span>
            </li>
            <li><span class="fa fa-files-o" aria-hidden="true"></span><span class="label">fa fa-files-o</span></li>
            <li><span class="fa fa-floppy-o" aria-hidden="true"></span><span class="label">fa fa-floppy-o</span></li>
            <li><span class="fa fa-font" aria-hidden="true"></span><span class="label">fa fa-font</span></li>
            <li><span class="fa fa-header" aria-hidden="true"></span><span class="label">fa fa-header</span></li>
            <li><span class="fa fa-indent" aria-hidden="true"></span><span class="label">fa fa-indent</span></li>
            <li><span class="fa fa-italic" aria-hidden="true"></span><span class="label">fa fa-italic</span></li>
            <li><span class="fa fa-link" aria-hidden="true"></span><span class="label">fa fa-link</span></li>
            <li><span class="fa fa-list" aria-hidden="true"></span><span class="label">fa fa-list</span></li>
            <li><span class="fa fa-list-alt" aria-hidden="true"></span><span class="label">fa fa-list-alt</span></li>
            <li><span class="fa fa-list-ol" aria-hidden="true"></span><span class="label">fa fa-list-ol</span></li>
            <li><span class="fa fa-list-ul" aria-hidden="true"></span><span class="label">fa fa-list-ul</span></li>
            <li><span class="fa fa-outdent" aria-hidden="true"></span><span class="label">fa fa-outdent</span></li>
            <li><span class="fa fa-paperclip" aria-hidden="true"></span><span class="label">fa fa-paperclip</span></li>
            <li><span class="fa fa-paragraph" aria-hidden="true"></span><span class="label">fa fa-paragraph</span></li>
            <li><span class="fa fa-paste" aria-hidden="true"></span><span class="label">fa fa-paste</span></li>
            <li><span class="fa fa-repeat" aria-hidden="true"></span><span class="label">fa fa-repeat</span></li>
            <li><span class="fa fa-rotate-left" aria-hidden="true"></span><span class="label">fa fa-rotate-left</span>
            </li>
            <li><span class="fa fa-rotate-right" aria-hidden="true"></span><span class="label">fa fa-rotate-right</span>
            </li>
            <li><span class="fa fa-save" aria-hidden="true"></span><span class="label">fa fa-save</span></li>
            <li><span class="fa fa-scissors" aria-hidden="true"></span><span class="label">fa fa-scissors</span></li>
            <li><span class="fa fa-strikethrough" aria-hidden="true"></span><span
                    class="label">fa fa-strikethrough</span></li>
            <li><span class="fa fa-subscript" aria-hidden="true"></span><span class="label">fa fa-subscript</span></li>
            <li><span class="fa fa-superscript" aria-hidden="true"></span><span class="label">fa fa-superscript</span>
            </li>
            <li><span class="fa fa-table" aria-hidden="true"></span><span class="label">fa fa-table</span></li>
            <li><span class="fa fa-text-height" aria-hidden="true"></span><span class="label">fa fa-text-height</span>
            </li>
            <li><span class="fa fa-text-width" aria-hidden="true"></span><span class="label">fa fa-text-width</span>
            </li>
            <li><span class="fa fa-th" aria-hidden="true"></span><span class="label">fa fa-th</span></li>
            <li><span class="fa fa-th-large" aria-hidden="true"></span><span class="label">fa fa-th-large</span></li>
            <li><span class="fa fa-th-list" aria-hidden="true"></span><span class="label">fa fa-th-list</span></li>
            <li><span class="fa fa-underline" aria-hidden="true"></span><span class="label">fa fa-underline</span></li>
            <li><span class="fa fa-undo" aria-hidden="true"></span><span class="label">fa fa-undo</span></li>
            <li><span class="fa fa-unlink" aria-hidden="true"></span><span class="label">fa fa-unlink</span></li>
            <li><span class="fa fa-angle-double-down" aria-hidden="true"></span><span class="label">fa fa-angle-double-down</span>
            </li>
            <li><span class="fa fa-angle-double-left" aria-hidden="true"></span><span class="label">fa fa-angle-double-left</span>
            </li>
            <li><span class="fa fa-angle-double-right" aria-hidden="true"></span><span class="label">fa fa-angle-double-right</span>
            </li>
            <li><span class="fa fa-angle-double-up" aria-hidden="true"></span><span
                    class="label">fa fa-angle-double-up</span></li>
            <li><span class="fa fa-angle-down" aria-hidden="true"></span><span class="label">fa fa-angle-down</span>
            </li>
            <li><span class="fa fa-angle-left" aria-hidden="true"></span><span class="label">fa fa-angle-left</span>
            </li>
            <li><span class="fa fa-angle-right" aria-hidden="true"></span><span class="label">fa fa-angle-right</span>
            </li>
            <li><span class="fa fa-angle-up" aria-hidden="true"></span><span class="label">fa fa-angle-up</span></li>
            <li><span class="fa fa-arrow-circle-down" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-down</span>
            </li>
            <li><span class="fa fa-arrow-circle-left" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-left</span>
            </li>
            <li><span class="fa fa-arrow-circle-o-down" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-o-down</span>
            </li>
            <li><span class="fa fa-arrow-circle-o-left" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-o-left</span>
            </li>
            <li><span class="fa fa-arrow-circle-o-right" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-o-right</span>
            </li>
            <li><span class="fa fa-arrow-circle-o-up" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-o-up</span>
            </li>
            <li><span class="fa fa-arrow-circle-right" aria-hidden="true"></span><span class="label">fa fa-arrow-circle-right</span>
            </li>
            <li><span class="fa fa-arrow-circle-up" aria-hidden="true"></span><span
                    class="label">fa fa-arrow-circle-up</span></li>
            <li><span class="fa fa-arrow-down" aria-hidden="true"></span><span class="label">fa fa-arrow-down</span>
            </li>
            <li><span class="fa fa-arrow-left" aria-hidden="true"></span><span class="label">fa fa-arrow-left</span>
            </li>
            <li><span class="fa fa-arrow-right" aria-hidden="true"></span><span class="label">fa fa-arrow-right</span>
            </li>
            <li><span class="fa fa-arrow-up" aria-hidden="true"></span><span class="label">fa fa-arrow-up</span></li>
            <li><span class="fa fa-arrows" aria-hidden="true"></span><span class="label">fa fa-arrows</span></li>
            <li><span class="fa fa-arrows-alt" aria-hidden="true"></span><span class="label">fa fa-arrows-alt</span>
            </li>
            <li><span class="fa fa-arrows-h" aria-hidden="true"></span><span class="label">fa fa-arrows-h</span></li>
            <li><span class="fa fa-arrows-v" aria-hidden="true"></span><span class="label">fa fa-arrows-v</span></li>
            <li><span class="fa fa-caret-down" aria-hidden="true"></span><span class="label">fa fa-caret-down</span>
            </li>
            <li><span class="fa fa-caret-left" aria-hidden="true"></span><span class="label">fa fa-caret-left</span>
            </li>
            <li><span class="fa fa-caret-right" aria-hidden="true"></span><span class="label">fa fa-caret-right</span>
            </li>
            <li><span class="fa fa-caret-square-o-down" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-down</span>
            </li>
            <li><span class="fa fa-caret-square-o-left" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-left</span>
            </li>
            <li><span class="fa fa-caret-square-o-right" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-right</span>
            </li>
            <li><span class="fa fa-caret-square-o-up" aria-hidden="true"></span><span class="label">fa fa-caret-square-o-up</span>
            </li>
            <li><span class="fa fa-caret-up" aria-hidden="true"></span><span class="label">fa fa-caret-up</span></li>
            <li><span class="fa fa-chevron-circle-down" aria-hidden="true"></span><span class="label">fa fa-chevron-circle-down</span>
            </li>
            <li><span class="fa fa-chevron-circle-left" aria-hidden="true"></span><span class="label">fa fa-chevron-circle-left</span>
            </li>
            <li><span class="fa fa-chevron-circle-right" aria-hidden="true"></span><span class="label">fa fa-chevron-circle-right</span>
            </li>
            <li><span class="fa fa-chevron-circle-up" aria-hidden="true"></span><span class="label">fa fa-chevron-circle-up</span>
            </li>
            <li><span class="fa fa-chevron-down" aria-hidden="true"></span><span class="label">fa fa-chevron-down</span>
            </li>
            <li><span class="fa fa-chevron-left" aria-hidden="true"></span><span class="label">fa fa-chevron-left</span>
            </li>
            <li><span class="fa fa-chevron-right" aria-hidden="true"></span><span
                    class="label">fa fa-chevron-right</span></li>
            <li><span class="fa fa-chevron-up" aria-hidden="true"></span><span class="label">fa fa-chevron-up</span>
            </li>
            <li><span class="fa fa-exchange" aria-hidden="true"></span><span class="label">fa fa-exchange</span></li>
            <li><span class="fa fa-hand-o-down" aria-hidden="true"></span><span class="label">fa fa-hand-o-down</span>
            </li>
            <li><span class="fa fa-hand-o-left" aria-hidden="true"></span><span class="label">fa fa-hand-o-left</span>
            </li>
            <li><span class="fa fa-hand-o-right" aria-hidden="true"></span><span class="label">fa fa-hand-o-right</span>
            </li>
            <li><span class="fa fa-hand-o-up" aria-hidden="true"></span><span class="label">fa fa-hand-o-up</span></li>
            <li><span class="fa fa-long-arrow-down" aria-hidden="true"></span><span
                    class="label">fa fa-long-arrow-down</span></li>
            <li><span class="fa fa-long-arrow-left" aria-hidden="true"></span><span
                    class="label">fa fa-long-arrow-left</span></li>
            <li><span class="fa fa-long-arrow-right" aria-hidden="true"></span><span class="label">fa fa-long-arrow-right</span>
            </li>
            <li><span class="fa fa-long-arrow-up" aria-hidden="true"></span><span
                    class="label">fa fa-long-arrow-up</span></li>
            <li><span class="fa fa-toggle-down" aria-hidden="true"></span><span class="label">fa fa-toggle-down</span>
            </li>
            <li><span class="fa fa-toggle-left" aria-hidden="true"></span><span class="label">fa fa-toggle-left</span>
            </li>
            <li><span class="fa fa-toggle-right" aria-hidden="true"></span><span class="label">fa fa-toggle-right</span>
            </li>
            <li><span class="fa fa-toggle-up" aria-hidden="true"></span><span class="label">fa fa-toggle-up</span></li>
            <li><span class="fa fa-arrows-alt" aria-hidden="true"></span><span class="label">fa fa-arrows-alt</span>
            </li>
            <li><span class="fa fa-backward" aria-hidden="true"></span><span class="label">fa fa-backward</span></li>
            <li><span class="fa fa-compress" aria-hidden="true"></span><span class="label">fa fa-compress</span></li>
            <li><span class="fa fa-eject" aria-hidden="true"></span><span class="label">fa fa-eject</span></li>
            <li><span class="fa fa-expand" aria-hidden="true"></span><span class="label">fa fa-expand</span></li>
            <li><span class="fa fa-fast-backward" aria-hidden="true"></span><span
                    class="label">fa fa-fast-backward</span></li>
            <li><span class="fa fa-fast-forward" aria-hidden="true"></span><span class="label">fa fa-fast-forward</span>
            </li>
            <li><span class="fa fa-forward" aria-hidden="true"></span><span class="label">fa fa-forward</span></li>
            <li><span class="fa fa-pause" aria-hidden="true"></span><span class="label">fa fa-pause</span></li>
            <li><span class="fa fa-pause-circle" aria-hidden="true"></span><span class="label">fa fa-pause-circle</span>
            </li>
            <li><span class="fa fa-pause-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-pause-circle-o</span></li>
            <li><span class="fa fa-play" aria-hidden="true"></span><span class="label">fa fa-play</span></li>
            <li><span class="fa fa-play-circle" aria-hidden="true"></span><span class="label">fa fa-play-circle</span>
            </li>
            <li><span class="fa fa-play-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-play-circle-o</span></li>
            <li><span class="fa fa-random" aria-hidden="true"></span><span class="label">fa fa-random</span></li>
            <li><span class="fa fa-step-backward" aria-hidden="true"></span><span
                    class="label">fa fa-step-backward</span></li>
            <li><span class="fa fa-step-forward" aria-hidden="true"></span><span class="label">fa fa-step-forward</span>
            </li>
            <li><span class="fa fa-stop" aria-hidden="true"></span><span class="label">fa fa-stop</span></li>
            <li><span class="fa fa-stop-circle" aria-hidden="true"></span><span class="label">fa fa-stop-circle</span>
            </li>
            <li><span class="fa fa-stop-circle-o" aria-hidden="true"></span><span
                    class="label">fa fa-stop-circle-o</span></li>
            <li><span class="fa fa-youtube-play" aria-hidden="true"></span><span class="label">fa fa-youtube-play</span>
            </li>
            <li><span class="fa fa-500px" aria-hidden="true"></span><span class="label">fa fa-500px</span></li>
            <li><span class="fa fa-adn" aria-hidden="true"></span><span class="label">fa fa-adn</span></li>
            <li><span class="fa fa-amazon" aria-hidden="true"></span><span class="label">fa fa-amazon</span></li>
            <li><span class="fa fa-android" aria-hidden="true"></span><span class="label">fa fa-android</span></li>
            <li><span class="fa fa-angellist" aria-hidden="true"></span><span class="label">fa fa-angellist</span></li>
            <li><span class="fa fa-apple" aria-hidden="true"></span><span class="label">fa fa-apple</span></li>
            <li><span class="fa fa-behance" aria-hidden="true"></span><span class="label">fa fa-behance</span></li>
            <li><span class="fa fa-behance-square" aria-hidden="true"></span><span
                    class="label">fa fa-behance-square</span></li>
            <li><span class="fa fa-bitbucket" aria-hidden="true"></span><span class="label">fa fa-bitbucket</span></li>
            <li><span class="fa fa-bitbucket-square" aria-hidden="true"></span><span class="label">fa fa-bitbucket-square</span>
            </li>
            <li><span class="fa fa-bitcoin" aria-hidden="true"></span><span class="label">fa fa-bitcoin</span></li>
            <li><span class="fa fa-black-tie" aria-hidden="true"></span><span class="label">fa fa-black-tie</span></li>
            <li><span class="fa fa-bluetooth" aria-hidden="true"></span><span class="label">fa fa-bluetooth</span></li>
            <li><span class="fa fa-bluetooth-b" aria-hidden="true"></span><span class="label">fa fa-bluetooth-b</span>
            </li>
            <li><span class="fa fa-btc" aria-hidden="true"></span><span class="label">fa fa-btc</span></li>
            <li><span class="fa fa-buysellads" aria-hidden="true"></span><span class="label">fa fa-buysellads</span>
            </li>
            <li><span class="fa fa-cc-amex" aria-hidden="true"></span><span class="label">fa fa-cc-amex</span></li>
            <li><span class="fa fa-cc-diners-club" aria-hidden="true"></span><span
                    class="label">fa fa-cc-diners-club</span></li>
            <li><span class="fa fa-cc-discover" aria-hidden="true"></span><span class="label">fa fa-cc-discover</span>
            </li>
            <li><span class="fa fa-cc-jcb" aria-hidden="true"></span><span class="label">fa fa-cc-jcb</span></li>
            <li><span class="fa fa-cc-mastercard" aria-hidden="true"></span><span
                    class="label">fa fa-cc-mastercard</span></li>
            <li><span class="fa fa-cc-paypal" aria-hidden="true"></span><span class="label">fa fa-cc-paypal</span></li>
            <li><span class="fa fa-cc-stripe" aria-hidden="true"></span><span class="label">fa fa-cc-stripe</span></li>
            <li><span class="fa fa-cc-visa" aria-hidden="true"></span><span class="label">fa fa-cc-visa</span></li>
            <li><span class="fa fa-chrome" aria-hidden="true"></span><span class="label">fa fa-chrome</span></li>
            <li><span class="fa fa-codepen" aria-hidden="true"></span><span class="label">fa fa-codepen</span></li>
            <li><span class="fa fa-codiepie" aria-hidden="true"></span><span class="label">fa fa-codiepie</span></li>
            <li><span class="fa fa-connectdevelop" aria-hidden="true"></span><span
                    class="label">fa fa-connectdevelop</span></li>
            <li><span class="fa fa-contao" aria-hidden="true"></span><span class="label">fa fa-contao</span></li>
            <li><span class="fa fa-css3" aria-hidden="true"></span><span class="label">fa fa-css3</span></li>
            <li><span class="fa fa-dashcube" aria-hidden="true"></span><span class="label">fa fa-dashcube</span></li>
            <li><span class="fa fa-delicious" aria-hidden="true"></span><span class="label">fa fa-delicious</span></li>
            <li><span class="fa fa-deviantart" aria-hidden="true"></span><span class="label">fa fa-deviantart</span>
            </li>
            <li><span class="fa fa-digg" aria-hidden="true"></span><span class="label">fa fa-digg</span></li>
            <li><span class="fa fa-dribbble" aria-hidden="true"></span><span class="label">fa fa-dribbble</span></li>
            <li><span class="fa fa-dropbox" aria-hidden="true"></span><span class="label">fa fa-dropbox</span></li>
            <li><span class="fa fa-drupal" aria-hidden="true"></span><span class="label">fa fa-drupal</span></li>
            <li><span class="fa fa-edge" aria-hidden="true"></span><span class="label">fa fa-edge</span></li>
            <li><span class="fa fa-empire" aria-hidden="true"></span><span class="label">fa fa-empire</span></li>
            <li><span class="fa fa-expeditedssl" aria-hidden="true"></span><span class="label">fa fa-expeditedssl</span>
            </li>
            <li><span class="fa fa-facebook" aria-hidden="true"></span><span class="label">fa fa-facebook</span></li>
            <li><span class="fa fa-facebook-f" aria-hidden="true"></span><span class="label">fa fa-facebook-f</span>
            </li>
            <li><span class="fa fa-facebook-official" aria-hidden="true"></span><span class="label">fa fa-facebook-official</span>
            </li>
            <li><span class="fa fa-facebook-square" aria-hidden="true"></span><span
                    class="label">fa fa-facebook-square</span></li>
            <li><span class="fa fa-firefox" aria-hidden="true"></span><span class="label">fa fa-firefox</span></li>
            <li><span class="fa fa-flickr" aria-hidden="true"></span><span class="label">fa fa-flickr</span></li>
            <li><span class="fa fa-fonticons" aria-hidden="true"></span><span class="label">fa fa-fonticons</span></li>
            <li><span class="fa fa-fort-awesome" aria-hidden="true"></span><span class="label">fa fa-fort-awesome</span>
            </li>
            <li><span class="fa fa-forumbee" aria-hidden="true"></span><span class="label">fa fa-forumbee</span></li>
            <li><span class="fa fa-foursquare" aria-hidden="true"></span><span class="label">fa fa-foursquare</span>
            </li>
            <li><span class="fa fa-ge" aria-hidden="true"></span><span class="label">fa fa-ge</span></li>
            <li><span class="fa fa-get-pocket" aria-hidden="true"></span><span class="label">fa fa-get-pocket</span>
            </li>
            <li><span class="fa fa-gg" aria-hidden="true"></span><span class="label">fa fa-gg</span></li>
            <li><span class="fa fa-gg-circle" aria-hidden="true"></span><span class="label">fa fa-gg-circle</span></li>
            <li><span class="fa fa-git" aria-hidden="true"></span><span class="label">fa fa-git</span></li>
            <li><span class="fa fa-git-square" aria-hidden="true"></span><span class="label">fa fa-git-square</span>
            </li>
            <li><span class="fa fa-github" aria-hidden="true"></span><span class="label">fa fa-github</span></li>
            <li><span class="fa fa-github-alt" aria-hidden="true"></span><span class="label">fa fa-github-alt</span>
            </li>
            <li><span class="fa fa-github-square" aria-hidden="true"></span><span
                    class="label">fa fa-github-square</span></li>
            <li><span class="fa fa-gittip" aria-hidden="true"></span><span class="label">fa fa-gittip</span></li>
            <li><span class="fa fa-google" aria-hidden="true"></span><span class="label">fa fa-google</span></li>
            <li><span class="fa fa-google-plus" aria-hidden="true"></span><span class="label">fa fa-google-plus</span>
            </li>
            <li><span class="fa fa-google-plus-square" aria-hidden="true"></span><span class="label">fa fa-google-plus-square</span>
            </li>
            <li><span class="fa fa-google-wallet" aria-hidden="true"></span><span
                    class="label">fa fa-google-wallet</span></li>
            <li><span class="fa fa-gratipay" aria-hidden="true"></span><span class="label">fa fa-gratipay</span></li>
            <li><span class="fa fa-hacker-news" aria-hidden="true"></span><span class="label">fa fa-hacker-news</span>
            </li>
            <li><span class="fa fa-houzz" aria-hidden="true"></span><span class="label">fa fa-houzz</span></li>
            <li><span class="fa fa-html5" aria-hidden="true"></span><span class="label">fa fa-html5</span></li>
            <li><span class="fa fa-instagram" aria-hidden="true"></span><span class="label">fa fa-instagram</span></li>
            <li><span class="fa fa-internet-explorer" aria-hidden="true"></span><span class="label">fa fa-internet-explorer</span>
            </li>
            <li><span class="fa fa-ioxhost" aria-hidden="true"></span><span class="label">fa fa-ioxhost</span></li>
            <li><span class="fa fa-joomla" aria-hidden="true"></span><span class="label">fa fa-joomla</span></li>
            <li><span class="fa fa-jsfiddle" aria-hidden="true"></span><span class="label">fa fa-jsfiddle</span></li>
            <li><span class="fa fa-lastfm" aria-hidden="true"></span><span class="label">fa fa-lastfm</span></li>
            <li><span class="fa fa-lastfm-square" aria-hidden="true"></span><span
                    class="label">fa fa-lastfm-square</span></li>
            <li><span class="fa fa-leanpub" aria-hidden="true"></span><span class="label">fa fa-leanpub</span></li>
            <li><span class="fa fa-linkedin" aria-hidden="true"></span><span class="label">fa fa-linkedin</span></li>
            <li><span class="fa fa-linkedin-square" aria-hidden="true"></span><span
                    class="label">fa fa-linkedin-square</span></li>
            <li><span class="fa fa-linux" aria-hidden="true"></span><span class="label">fa fa-linux</span></li>
            <li><span class="fa fa-maxcdn" aria-hidden="true"></span><span class="label">fa fa-maxcdn</span></li>
            <li><span class="fa fa-meanpath" aria-hidden="true"></span><span class="label">fa fa-meanpath</span></li>
            <li><span class="fa fa-medium" aria-hidden="true"></span><span class="label">fa fa-medium</span></li>
            <li><span class="fa fa-mixcloud" aria-hidden="true"></span><span class="label">fa fa-mixcloud</span></li>
            <li><span class="fa fa-modx" aria-hidden="true"></span><span class="label">fa fa-modx</span></li>
            <li><span class="fa fa-odnoklassniki" aria-hidden="true"></span><span
                    class="label">fa fa-odnoklassniki</span></li>
            <li><span class="fa fa-odnoklassniki-square" aria-hidden="true"></span><span class="label">fa fa-odnoklassniki-square</span>
            </li>
            <li><span class="fa fa-opencart" aria-hidden="true"></span><span class="label">fa fa-opencart</span></li>
            <li><span class="fa fa-openid" aria-hidden="true"></span><span class="label">fa fa-openid</span></li>
            <li><span class="fa fa-opera" aria-hidden="true"></span><span class="label">fa fa-opera</span></li>
            <li><span class="fa fa-optin-monster" aria-hidden="true"></span><span
                    class="label">fa fa-optin-monster</span></li>
            <li><span class="fa fa-pagelines" aria-hidden="true"></span><span class="label">fa fa-pagelines</span></li>
            <li><span class="fa fa-paypal" aria-hidden="true"></span><span class="label">fa fa-paypal</span></li>
            <li><span class="fa fa-pied-piper" aria-hidden="true"></span><span class="label">fa fa-pied-piper</span>
            </li>
            <li><span class="fa fa-pied-piper-alt" aria-hidden="true"></span><span
                    class="label">fa fa-pied-piper-alt</span></li>
            <li><span class="fa fa-pinterest" aria-hidden="true"></span><span class="label">fa fa-pinterest</span></li>
            <li><span class="fa fa-pinterest-p" aria-hidden="true"></span><span class="label">fa fa-pinterest-p</span>
            </li>
            <li><span class="fa fa-pinterest-square" aria-hidden="true"></span><span class="label">fa fa-pinterest-square</span>
            </li>
            <li><span class="fa fa-product-hunt" aria-hidden="true"></span><span class="label">fa fa-product-hunt</span>
            </li>
            <li><span class="fa fa-qq" aria-hidden="true"></span><span class="label">fa fa-qq</span></li>
            <li><span class="fa fa-ra" aria-hidden="true"></span><span class="label">fa fa-ra</span></li>
            <li><span class="fa fa-rebel" aria-hidden="true"></span><span class="label">fa fa-rebel</span></li>
            <li><span class="fa fa-reddit" aria-hidden="true"></span><span class="label">fa fa-reddit</span></li>
            <li><span class="fa fa-reddit-alien" aria-hidden="true"></span><span class="label">fa fa-reddit-alien</span>
            </li>
            <li><span class="fa fa-reddit-square" aria-hidden="true"></span><span
                    class="label">fa fa-reddit-square</span></li>
            <li><span class="fa fa-renren" aria-hidden="true"></span><span class="label">fa fa-renren</span></li>
            <li><span class="fa fa-safari" aria-hidden="true"></span><span class="label">fa fa-safari</span></li>
            <li><span class="fa fa-scribd" aria-hidden="true"></span><span class="label">fa fa-scribd</span></li>
            <li><span class="fa fa-sellsy" aria-hidden="true"></span><span class="label">fa fa-sellsy</span></li>
            <li><span class="fa fa-share-alt" aria-hidden="true"></span><span class="label">fa fa-share-alt</span></li>
            <li><span class="fa fa-share-alt-square" aria-hidden="true"></span><span class="label">fa fa-share-alt-square</span>
            </li>
            <li><span class="fa fa-shirtsinbulk" aria-hidden="true"></span><span class="label">fa fa-shirtsinbulk</span>
            </li>
            <li><span class="fa fa-simplybuilt" aria-hidden="true"></span><span class="label">fa fa-simplybuilt</span>
            </li>
            <li><span class="fa fa-skyatlas" aria-hidden="true"></span><span class="label">fa fa-skyatlas</span></li>
            <li><span class="fa fa-skype" aria-hidden="true"></span><span class="label">fa fa-skype</span></li>
            <li><span class="fa fa-slack" aria-hidden="true"></span><span class="label">fa fa-slack</span></li>
            <li><span class="fa fa-slideshare" aria-hidden="true"></span><span class="label">fa fa-slideshare</span>
            </li>
            <li><span class="fa fa-soundcloud" aria-hidden="true"></span><span class="label">fa fa-soundcloud</span>
            </li>
            <li><span class="fa fa-spotify" aria-hidden="true"></span><span class="label">fa fa-spotify</span></li>
            <li><span class="fa fa-stack-exchange" aria-hidden="true"></span><span
                    class="label">fa fa-stack-exchange</span></li>
            <li><span class="fa fa-stack-overflow" aria-hidden="true"></span><span
                    class="label">fa fa-stack-overflow</span></li>
            <li><span class="fa fa-steam" aria-hidden="true"></span><span class="label">fa fa-steam</span></li>
            <li><span class="fa fa-steam-square" aria-hidden="true"></span><span class="label">fa fa-steam-square</span>
            </li>
            <li><span class="fa fa-stumbleupon" aria-hidden="true"></span><span class="label">fa fa-stumbleupon</span>
            </li>
            <li><span class="fa fa-stumbleupon-circle" aria-hidden="true"></span><span class="label">fa fa-stumbleupon-circle</span>
            </li>
            <li><span class="fa fa-tencent-weibo" aria-hidden="true"></span><span
                    class="label">fa fa-tencent-weibo</span></li>
            <li><span class="fa fa-trello" aria-hidden="true"></span><span class="label">fa fa-trello</span></li>
            <li><span class="fa fa-tripadvisor" aria-hidden="true"></span><span class="label">fa fa-tripadvisor</span>
            </li>
            <li><span class="fa fa-tumblr" aria-hidden="true"></span><span class="label">fa fa-tumblr</span></li>
            <li><span class="fa fa-tumblr-square" aria-hidden="true"></span><span
                    class="label">fa fa-tumblr-square</span></li>
            <li><span class="fa fa-twitch" aria-hidden="true"></span><span class="label">fa fa-twitch</span></li>
            <li><span class="fa fa-twitter" aria-hidden="true"></span><span class="label">fa fa-twitter</span></li>
            <li><span class="fa fa-twitter-square" aria-hidden="true"></span><span
                    class="label">fa fa-twitter-square</span></li>
            <li><span class="fa fa-usb" aria-hidden="true"></span><span class="label">fa fa-usb</span></li>
            <li><span class="fa fa-viacoin" aria-hidden="true"></span><span class="label">fa fa-viacoin</span></li>
            <li><span class="fa fa-vimeo" aria-hidden="true"></span><span class="label">fa fa-vimeo</span></li>
            <li><span class="fa fa-vimeo-square" aria-hidden="true"></span><span class="label">fa fa-vimeo-square</span>
            </li>
            <li><span class="fa fa-vine" aria-hidden="true"></span><span class="label">fa fa-vine</span></li>
            <li><span class="fa fa-vk" aria-hidden="true"></span><span class="label">fa fa-vk</span></li>
            <li><span class="fa fa-wechat" aria-hidden="true"></span><span class="label">fa fa-wechat</span></li>
            <li><span class="fa fa-weibo" aria-hidden="true"></span><span class="label">fa fa-weibo</span></li>
            <li><span class="fa fa-weixin" aria-hidden="true"></span><span class="label">fa fa-weixin</span></li>
            <li><span class="fa fa-whatsapp" aria-hidden="true"></span><span class="label">fa fa-whatsapp</span></li>
            <li><span class="fa fa-wikipedia-w" aria-hidden="true"></span><span class="label">fa fa-wikipedia-w</span>
            </li>
            <li><span class="fa fa-windows" aria-hidden="true"></span><span class="label">fa fa-windows</span></li>
            <li><span class="fa fa-wordpress" aria-hidden="true"></span><span class="label">fa fa-wordpress</span></li>
            <li><span class="fa fa-xing" aria-hidden="true"></span><span class="label">fa fa-xing</span></li>
            <li><span class="fa fa-xing-square" aria-hidden="true"></span><span class="label">fa fa-xing-square</span>
            </li>
            <li><span class="fa fa-y-combinator" aria-hidden="true"></span><span class="label">fa fa-y-combinator</span>
            </li>
            <li><span class="fa fa-y-combinator-square" aria-hidden="true"></span><span class="label">fa fa-y-combinator-square</span>
            </li>
            <li><span class="fa fa-yahoo" aria-hidden="true"></span><span class="label">fa fa-yahoo</span></li>
            <li><span class="fa fa-yc" aria-hidden="true"></span><span class="label">fa fa-yc</span></li>
            <li><span class="fa fa-yc-square" aria-hidden="true"></span><span class="label">fa fa-yc-square</span></li>
            <li><span class="fa fa-yelp" aria-hidden="true"></span><span class="label">fa fa-yelp</span></li>
            <li><span class="fa fa-youtube" aria-hidden="true"></span><span class="label">fa fa-youtube</span></li>
            <li><span class="fa fa-youtube-play" aria-hidden="true"></span><span class="label">fa fa-youtube-play</span>
            </li>
            <li><span class="fa fa-youtube-square" aria-hidden="true"></span><span
                    class="label">fa fa-youtube-square</span></li>

            <li><span class="fa fa-ambulance" aria-hidden="true"></span><span class="label">fa fa-ambulance</span></li>
            <li><span class="fa fa-h-square" aria-hidden="true"></span><span class="label">fa fa-h-square</span></li>
            <li><span class="fa fa-heart" aria-hidden="true"></span><span class="label">fa fa-heart</span></li>
            <li><span class="fa fa-heart-o" aria-hidden="true"></span><span class="label">fa fa-heart-o</span></li>
            <li><span class="fa fa-heartbeat" aria-hidden="true"></span><span class="label">fa fa-heartbeat</span></li>
            <li><span class="fa fa-hospital-o" aria-hidden="true"></span><span class="label">fa fa-hospital-o</span>
            </li>
            <li><span class="fa fa-medkit" aria-hidden="true"></span><span class="label">fa fa-medkit</span></li>
            <li><span class="fa fa-plus-square" aria-hidden="true"></span><span class="label">fa fa-plus-square</span>
            </li>
            <li><span class="fa fa-stethoscope" aria-hidden="true"></span><span class="label">fa fa-stethoscope</span>
            </li>
            <li><span class="fa fa-user-md" aria-hidden="true"></span><span class="label">fa fa-user-md</span></li>
            <li><span class="fa fa-wheelchair" aria-hidden="true"></span><span class="label">fa fa-wheelchair</span>
            </li>
        </ul>
    </div>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/ztree/js/jquery.ztree.all-3.5.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/table.tree.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/resource/resource.js"></script>
</myJs>
</body>
</html>