<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="icon" type="image/png" href="static/img/favicon.png" sizes="32x32">
		<link rel="apple-touch-icon" href="static/img/apple-touch-icon.png">
		<title>{$title|gettext|escape} | {$pagename|escape}</title>
		<link rel="stylesheet" href="{$theme}">
		<link rel="stylesheet" href="vendor/components/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="static/css/styles.css">
		<script src="static/js/jquery.min.js"></script>
		{foreach $javascript as $js}<script src="{$js}"></script>{/foreach}
		<script src="vendor/twbs/bootstrap/dist/js/bootstrap.min.js"></script>
	</head>
	<body class="{$body_class}">
	{if $username}
		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					{if $brand_logo}
						<div class="navbar-brand">
							<img src="{$brand_logo}" style="height: {$brand_logo_height}px;">
						</div>
					{else}
						<a class="navbar-brand visible-xs" data-toggle="collapse" data-target="#navbar-collapse">{$title|gettext|escape}</a>
					{/if}
				</div>
				<div class="collapse navbar-collapse" id="navbar-collapse">
					<ul class="nav navbar-nav">
						{if $page_active=="index"}<li class="active">{else}<li>{/if}<a href="?page=index"><i class="fa fa-envelope-o"></i>&nbsp;{t}Messages{/t}</a></li>
						{if $feature_bwlist}
							{if $page_active=="bwlist"}<li class="active">{else}<li>{/if}<a href="?page=bwlist"><i class="fa fa-list"></i>&nbsp;{t}Black/whitelist{/t}</a></li>
						{/if}
						{if $feature_spam}
							{if $page_active=="spam"}<li class="active">{else}<li>{/if}<a href="?page=spam"><i class="fa fa-cog"></i>&nbsp;{t}Spam settings{/t}</a></li>
						{/if}
						{if $feature_stats}
							{if $page_active=="stats"}<li class="active">{else}<li>{/if}<a href="?page=stats"><i class="fa fa-pie-chart"></i>&nbsp;{t}Statistics{/t}</a></li>
						{/if}
						{if $feature_datastore}
							{if $page_active=="datastore"}<li class="active">{else}<li>{/if}<a href="?page=datastore"><i class="fa fa-database"></i>&nbsp;{t}Data store{/t}</a></li>
						{/if}
						{if $feature_rates}
							{if $page_active=="rates"}<li class="active">{else}<li>{/if}<a href="?page=rates"><i class="fa fa-tachometer"></i>&nbsp;{t}Rate limit{/t}</a></li>
						{/if}
					</ul>
					<ul class="nav navbar-nav navbar-right" style="padding-right: 10px;">
						{if $page_active=="user"}<li class="active">{else}<li>{/if}<a href="?page=user"><i class="fa fa-user"></i>&nbsp;{$username|escape}</a></li>
						<li><a href="?page=logout"><i class="fa fa-sign-out"></i>&nbsp;{t}Sign out{/t}</a></li>
					</ul>
				</div>
			</div>
		</nav>
	{/if}
