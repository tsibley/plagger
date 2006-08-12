use t::TestPlagger;
use Plagger::UserAgent;

test_requires('HTTP::Cookies::Safari');
plan 'no_plan';
run_eval_expected_with_capture;

__END__

=== Test with non-existent file
--- input config
global:
  user_agent:
    cookies: /blahblahblah/Cookies.plist
  log:
    level: warn
plugins:
  - module: Subscription::Config
    # hack to use rule for eval
    rule:
      expression: Plagger::UserAgent->new;
--- expected
like $warning, qr/Cookies\.plist: No such file/;

