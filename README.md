# Java-MT
基于SSM的博客管理系统--BlogSSM
<h5><a id="user-content-一介绍" class="anchor" aria-hidden="true" href="#一介绍"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>一、介绍</h5>
<p>根据所学知识进行一个全面整合。做了一个SSM整合的项目。这是一套简单易上手的后台管理系统，使用Spring、SpringMVC、Mybatis、Shiro、Layui等构建。可以在一些网站管理进行应用。在这个项目做了一些功能，后期还会进行改善~~</p>
<blockquote>
<p>实现的系统功能：</p>
<ul>
<li>博客管理
<ul>
<li>文章管理</li>
</ul>
</li>
<li>博客类别管理
<ul>
<li>类别信息管理</li>
</ul>
</li>
<li>管理员管理
<ul>
<li>用户管理</li>
</ul>
</li>
<li>友情链接管理
<ul>
<li>链接管理</li>
</ul>
</li>
<li>评论管理
<ul>
<li>评论信息管理</li>
</ul>
</li>
<li>系统管理
<ul>
<li>刷新页面</li>
</ul>
</li>
</ul>
</blockquote>
<h5><a id="user-content-二技术选型" class="anchor" aria-hidden="true" href="#二技术选型"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>二、技术选型</h5>
<h6><a id="user-content-21技术组合" class="anchor" aria-hidden="true" href="#21技术组合"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>2.1、技术组合</h6>
<ul>
<li>数据库：Mysql</li>
<li>技术组合：Spring、SpringMvc、Mybatis、pageHelper、Ajax、Shiro</li>
<li>前端框架：Layui、Bootstrap</li>
<li>数据源：Druid数据源监控</li>
</ul>
<h5><a id="user-content-三开发环境" class="anchor" aria-hidden="true" href="#三开发环境"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>三、开发环境</h5>
<h6><a id="user-content-31工具与环境" class="anchor" aria-hidden="true" href="#31工具与环境"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.1、工具与环境</h6>
<ul>
<li>Eclipse 2019-06 (4.12.0)</li>
<li>Maven</li>
<li>JDK1.8</li>
<li>Mysql 5.7</li>
<li>Win7 64位系统</li>
</ul>
<h5><a id="user-content-四项目演示" class="anchor" aria-hidden="true" href="#四项目演示"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>四、项目演示</h5>
<h6><a id="user-content-41相关页面截图" class="anchor" aria-hidden="true" href="#41相关页面截图"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>4.1、相关页面截图</h6>
<table>
    <tbody><tr>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/Login.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/Login.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/Login.jpg" style="max-width:100%;"></a></td>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/main.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/main.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/main.jpg" style="max-width:100%;"></a></td>
    </tr>
    <tr>
       <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/administrator.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/administrator.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/administrator.jpg" style="max-width:100%;"></a></td>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/article.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/article.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/article.jpg" style="max-width:100%;"></a></td>
    </tr>
    <tr>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/blogmessage.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/blogmessage.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/blogmessage.jpg" style="max-width:100%;"></a></td>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/pmessage.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/pmessage.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/pmessage.jpg" style="max-width:100%;"></a></td>
    </tr>
	<tr>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/link.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/link.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/link.jpg" style="max-width:100%;"></a></td>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/comment.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/comment.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/comment.jpg" style="max-width:100%;"></a></td>
    </tr>	 
    <tr>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/alink.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/alink.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/alink.jpg" style="max-width:100%;"></a></td>
        <td><a target="_blank" rel="noopener noreferrer" href="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/about.jpg"><img src="https://raw.githubusercontent.com/Code-WZB/BlogSSM-photo/master/about.jpg" data-canonical-src="https://github.com/Code-WZB/BlogSSM-photo/blob/master/about.jpg" style="max-width:100%;"></a></td>
    </tr>
</tbody></table>
<h5><a id="user-content-五启动" class="anchor" aria-hidden="true" href="#五启动"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>五、启动</h5>
<p>可以使用maven tomcat插件进行启动</p>
<pre><code>1. 主配置文件：applicationContext.xml，此文件中配置数据库账户密码，还有些事务等都在这里配置。
2. 其它配置：<br>
1)、mybatis-config.xml，这个文件主要是配置一些分页插件和分页参数。
2)、log4j.properties，这个是日志配置文件。
3)、applicationContext-shiro.xml和ehcache.xml，这两个主要是配置shiro的配置，校验和拦截的。
4)、springmvc.xml，这个主要是配置视图解析器等。
5)、mbg.xml，这个是mybatis逆向工程的配置文件，因为本项目用到mybatis的逆向工程来生成实体类、DAO层和mapper映射文件。
3. 启动访问：http://localhost:您配置的tomcat端口号/BlogSSM
4. 账户密码：administrator/111111(超级管理员账号)，其它见数据库。密码尝试为111111
</code></pre>
</article>
  </div>
  <b>以上仅是我的个人所做的，谢谢您的观看，望指点！</b>
