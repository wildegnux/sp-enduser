{include file='header.tpl' title='Spam settings'}

{$levels = array()}
{capture assign="level"}{t}Disabled{/t}{/capture}
{$levels['disabled'] = $level}
{capture assign="level"}{t}Low{/t}{/capture}
{$levels['low'] = $level}
{capture assign="level"}{t}Medium{/t}{/capture}
{$levels['medium'] = $level}
{capture assign="level"}{t}High{/t}{/capture}
{$levels['high'] = $level}

<div class="container-fluid">
	<div class="col-md-7 col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					{t}Spam settings{/t}
					<a class="pull-right" data-toggle="collapse" href="#search">
						<span class="fa fa-search"></span>
					</a>
					<a id="link-add" class="pull-right visible-sm visible-xs" style="margin-right: 15px;">
						<span class="fa fa-plus"></span>
					</a>
				</h3>
			</div>
			<div id="search" class="{if $search}collapse in{else}collapse{/if}" aria-expanded="{if $search}true{else}false{/if}">
				<div class="panel-body">
					<form class="form-horizontal" method="get">
						<input type="hidden" name="page" value="{$page_active}">
						<input type="hidden" name="limit" value="{$limit}">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="{t}Search for...{/t}" name="search" value="{$search|escape}">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="search"><span class="fa fa-search"></span></button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<table class="table table-hover table-fixed">
				<thead class="hidden-xs">
					<tr>
						<th>{t}For recipient{/t}</th>
						<th>{t}Level{/t}</th>
						<th style="width: 30px"></th>
						<th style="width: 30px"></th>
					</tr>
				</thead>
				<tbody>
				{foreach $items as $item}
					{$item_id = $item_id + 1}
					<tr id="item-{$item_id}" data-access="{$item.access|escape}" data-level="{$levels[$item.settings->level]}" class="item">
						<td class="item-access hidden-xs">{if $item.access}{$item.access|escape}{else}<span class="text-muted">{t}everyone{/t}</span>{/if}</td>
						<td class="item-level hidden-xs">{$levels[$item.settings->level]}</td>
						<td class="visible-xs">
							<dl class="dl-horizontal dl-horizontal-xs">
								<dt>{t}For recipient{/t}</dt><dd>{if $item.access}{$item.access|escape}{else}<span class="text-muted">{t}everyone{/t}</span>{/if}</dd>
								<dt>{t}Level{/t}</dt><dd>{$levels[$item.settings->level]}</dd>
							</dl>
						</td>
						<td style="width: 30px; vertical-align: middle">
							<a title="{t}Edit{/t}"><i class="fa fa-pencil-square-o"></i></a>
						</td>
						<td style="width: 30px; vertical-align: middle">
							<a class="spam_delete" title="{t}Remove{/t}"><i class="fa fa-remove"></i></a>
						</td>
					</tr>
				{foreachelse}
					<tr><td colspan="6" class="text-muted">{t}No spam settings{/t}</td></tr>
				{/foreach}
				</tbody>
			</table>
		</div>
		{include file='pager.tpl'}
	</div>
	<div class="col-md-5 col-lg-4">
		<div id="side-panel" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title hidden-edit">{t}Add{/t}</h3>
				<h3 class="panel-title visible-edit hidden">{t}Edit{/t}</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" id="spam_add">
					<input type="hidden" id="action" value="add">
					<input id="edit-id" type="hidden">
					<div class="form-group">
						<label for="type" class="control-label col-md-3">{t}Level{/t}</label>
						<div class="col-md-9">
							<select id="level" class="form-control">
								<option value="">{t}Select level{/t}</option>
								{html_options options=$levels}
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3" style="white-space: nowrap;">{t}For recipient{/t}</label>
						<div class="col-md-9">
							<p id="edit-recipient" class="form-control-static visible-edit hidden"></p>
							{if count($useraccess) == 1}
								<input type="hidden" class="form-control recipient" value="{$useraccess.0|escape}">
								<p class="form-control-static hidden-edit">{$useraccess.0|escape}</p>
							{elseif count($useraccess) > 0}
								<button id="check-all" class="btn btn-info hidden-edit">{t}Select all{/t}</button>
								<button id="add-access" class="btn btn-default hidden-edit">{t}Add custom{/t}</button>
								{if count($useraccess) > 5}<div id="access-panel" class="panel panel-default hidden-edit" style="height: 115px; padding-left: 10px; margin-top: 5px; overflow-y: scroll;">{/if}
								<div id="extra-accesses" class="hidden-edit"></div>
								{foreach $useraccess as $a}
								<div class="checkbox hidden-edit">
									<label>
										<input type="checkbox" class="recipient" value="{$a|escape}"> {$a|escape}
									</label>
								</div>
								{/foreach}
								{if count($useraccess) > 5}</div>{/if}
							{else}
								<input type="text" class="form-control recipient hidden-edit" placeholder="{t}everyone{/t}">
							{/if}
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-3 col-md-9">
							<button id="btn-add" type="submit" class="btn btn-primary hidden-edit">{t}Add{/t}</button>
							<button id="btn-edit" type="submit" class="btn btn-primary visible-edit hidden">{t}Save{/t}</button>
							<button id="btn-cancel" type="button" class="btn btn-default visible-edit hidden">{t}Cancel{/t}</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
{include file='footer.tpl'}
