String convertStringToUserStatus(String statusString) {
  switch (statusString) {
    case 'absent':
      return 'nieobecny';
    case 'entrance':
      return 'w pracy';
    case 'working':
      return 'pracuje';
    case 'startBreak':
      return 'na przerwie';
    case 'endedBreak':
      return 'po przerwie (w pracy)';
    default:
      return '';
  }
}
