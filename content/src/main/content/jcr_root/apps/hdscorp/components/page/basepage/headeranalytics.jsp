<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.config.HdsCorpGlobalConfiguration"%>

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'google-account-here' ]);
	_gaq.push(['_setDomainName', 'hds.com']);
	_gaq.push(['_setAllowAnchor', true]);
	_gaq.push([ '_trackPageview' ]);


	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>


