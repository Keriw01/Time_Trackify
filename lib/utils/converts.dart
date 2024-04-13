String convertStringToUserStatus(String statusString) {
  switch (statusString) {
    case 'absent':
      return 'nieobecny';
    case 'working':
      return 'pracuje';
    case 'break':
      return 'na przerwie';
    default:
      return '';
  }
}
