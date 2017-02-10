<nav>
	{if $total && count($pages)}
	<ul class="pagination">
		{foreach $pages as $p}
			{if $p === '...'}
			<li class="disabled"><a href="#">...</a></li>
			{elseif $p === $currpage}
			<li class="active"><a href="#">{$p+1}</a></li>
			{else}
			<li><a href="?page={$page_active}&amp;offset={$limit*$p}&amp;limit={$limit}{if $search|is_array}{foreach from=$search key=k item=v}&amp;{$k}={$v|urlencode}{/foreach}{elseif $search}&amp;search={$search|urlencode}{/if}">
				{$p+1}
			</a></li>
			{/if}
		{/foreach}
	</ul>
	{elseif !$total && count($items)}
	<ul class="pager">
		<li class="previous{if $offset == 0} disabled{/if}">
			<a href="javascript:history.go(-1);"><span aria-hidden="true">&larr;</span> {t}Previous{/t}</a>
		</li>
		<li class="next{if !$pagemore} disabled{/if}">
			<a href="?page={$page_active}&amp;offset={$offset+$limit}&amp;limit={$limit}{if $search|is_array}{foreach from=$search key=k item=v}&amp;{$k}={$v|urlencode}{/foreach}{elseif $search}&amp;search={$search|urlencode}{/if}">
				{t}Next{/t} <span aria-hidden="true">&rarr;</span>
			</a>
		</li>
	</ul>
	{/if}
</nav>
<p class="text-muted small">{t}Results per page:{/t}</p>
<div class="btn-group" role="group" aria-label="Results per page" style="margin-bottom: 40px;">
	{foreach $pagesizes as $pagesize}
	<a class="btn btn-sm btn-default{if $limit==$pagesize} active{/if}" href="?page={$page_active}&amp;limit={$pagesize}{if $search|is_array}{foreach from=$search key=k item=v}&amp;{$k}={$v|urlencode}{/foreach}{elseif $search}&amp;search={$search|urlencode}{/if}">
		{$pagesize}
	</a>
	{/foreach}
</div>
