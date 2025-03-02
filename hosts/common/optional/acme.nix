{
  security.acme = {
    defaults.email = "mail@philippschuetz.com";
    acceptTerms = true;
  };
  # enabling ipv6 prevents successful https cert renewal over dns-01
  # networking.enableIPv6 = false;
}
