<?php

require_once 'gettext.php';

$smarty = new Smarty();
$smarty->compile_dir = '/tmp/';
$smarty->template_dir = './templates/';

if ($smarty_no_assign) {
	unset($smart_no_assign);
	return;
}

$smarty->assign('theme', $settings->getTheme());
$smarty->assign('brand_logo', $settings->getBrandLogo());
$smarty->assign('brand_logo_height', $settings->getBrandLogoHeight());
$smarty->assign('pagename', $settings->getPageName());
if (Session::Get()->getUsername()) $smarty->assign('username', Session::Get()->getUsername());

if (isset($javascript)) $smarty->assign('javascript', $javascript);

$dbCredentials = $settings->getDBCredentials();
if ($dbCredentials['dsn'] && $settings->getDisplayBWList()) $smarty->assign('feature_bwlist', true);
if ($dbCredentials['dsn'] && $settings->getDisplaySpamSettings()) $smarty->assign('feature_spam', true);
$access = Session::Get()->getAccess();
if ((count($access['domain']) > 0 || isset($access['userid'])) && $settings->getDisplayStats()) $smarty->assign('feature_stats', true);
if (count($access) == 0 && $settings->getDisplayRateLimits()) $smarty->assign('feature_rates', true);
if (count($access) == 0 && $dbCredentials['dsn'] && $settings->getDisplayDataStore()) $smarty->assign('feature_datastore', true);

if (isset($body_class)) $smarty->assign('body_class', $body_class);
