<#import "parts/common.ftlh" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form action="/main" method="get" class="form-inline">
            <input type="text" name="filter" value="${filter?ifExists}" class="form-control" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>
<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample" data-bs-target="#collapseExample">
    <div class="form-group mt-3">
        <form action="/main" method="post" enctype="multipart/form-data">>
            <div class="form-group">
                <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>"
                       placeholder="Type your message">
                <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" name="tag" class="form-control" placeholder="Tag">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" class="form-control" id="customFile">
                    <label class="custom-file-label" for="customFile"></label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
    <div class="card my-3" style="width: 18rem;">
        <div>
            <#if message.filename??>
            <img src="/img/${message.filename}" alt="" class="card-img-top">
            </#if>
        </div>
        <div class="m-2">
            <span>${message.text}</span>
            <i>${message.tag}</i>
        </div>
        <div class="card-footer text-muted">
            ${message.authorName}
        </div>
    </div>
    <#else>
    No messages
    </#list>
</div>
</@c.page>