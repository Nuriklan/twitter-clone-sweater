<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div>
    <@l.logout />
</div>
<div>
    <form action="/main" method="post">
        <input type="text" name="text" placeholder="Type your message">
        <input type="text" name="tag" placeholder="Tag">
        <button type="submit">Add</button>
    </form>
</div>
<div>Messages</div>
<div>
    <form action="/main" method="get">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Find</button>
    </form>
</div>
<#list messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
    <strong>${message.authorName}</strong>
</div>
<#else>
No messages
</#list>
</@c.page>