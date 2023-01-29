<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div>
    <@l.logout />
    <span><a href="/user">User list</a></span>
</div>
<div>
    <form action="/main" method="post" enctype="multipart/form-data">>
        <input type="text" name="text" placeholder="Type your message">
        <input type="text" name="tag" placeholder="Tag">
        <input type="file" name="file">
        <button type="submit">Add</button>
    </form>
</div>
<div>Messages</div>
<div>
    <form action="/main" method="get">
        <input type="text" name="filter" value="${filter?ifExists}">
        <button type="submit">Find</button>
    </form>
</div>
<#list messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
    <strong>${message.authorName}</strong>
    <div>
        <#if message.filename??>
        <img src="/img/${message.filename}" alt="">
    </#if>
</div>
</div>
<#else>
No messages
</#list>
</@c.page>