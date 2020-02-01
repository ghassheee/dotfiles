
# BAN IPs

IPBAN=~/.ipban
BANLIST=$IPBAN/banlist
DARKLIST=$IPBAN/darklist
BLACKLIST=$IPBAN/blacklist
WHITELIST=$IPBAN/whitelist
NEW_BLACKLIST=$IPBAN/new_blacklist
NEW_WHITELIST=$IPBAN/new_whitelist
CUR_BANLIST=$IPBAN/cur_banlist
IPTABLE_RULE=$IPBAN/iptables.rules
RENEW_BANLIST=$IPBAN/renew_banlist
MERGE_BANLIST=$IPBAN/merge_banlist
DIFF_BANLIST=$IPBAN/diff_banlist
LOG_BANLIST=$IPBAN/ban.log
BLACKIP=$IPBAN/blackip.txt

add_ip      (){ sudo iptables -A INPUT -s $1 -j DROP }
del_ip      (){ sudo iptables -D INPUT -s $1 -j DROP }
list2rules  (){ for i in $(cat $1); do echo "-A INPUT -s ${i}/32 -j DROP"; done }
list2banq   (){ for i in $(cat $1); do add_ip $i; echo "$i is banned"; done }
list2ban    (){ echo "baning    $1"; for i in $(cat $1); do add_ip $i; red; echo "$(date) $i is banned"  |tee -a $LOG_BANLIST; white; done }
list2unban  (){ echo "Unbanning $1"; for i in $(cat $1); do del_ip $i; blue;echo "$(date) $i is unbanned"|tee -a $LOG_BANLIST; white; done }
merge_lists (){ cat $@ | sq }
diff_lists  (){ diff $1 $2 | grep '<' | sed -e 's/< //' }

alias new_darklist="  jctl -u sshd | grepip | sq"
alias new_blacklist=" jctl -u sshd | grep 'Disconnected\|Failed\|Did' | grepip | sq"
alias new_whitelist=" jctl -u sshd | grep Accepted | grepip | sq"

alias blacklist="   { cat $BLACKLIST; new_blacklist } | sq "
alias whitelist="   { cat $WHITELIST; new_whitelist } | sq "
alias darklist="    { cat $DARKLIST;  new_darklist  } | sq " 
alias merge_dark="    blackle; darkle;  merge_lists $DARKLIST $BLACKLIST > $BLACKLIST "
alias banlist="       merge_dark; whitele; diff_lists $BLACKLIST $WHITELIST " 
alias cur_banlist="   sudo iptables-save | grep '\-A INPUT' | awk {'print \$4'} | sed 's/\/32//g' | sq "
alias merge_banlist=' banle; cur_banle; merge_lists $BANLIST $CUR_BANLIST '
alias diff_banlist="  merge_banle; diff_lists $MERGE_BANLIST $CUR_BANLIST "

alias ban='           diff_banle; list2ban   $DIFF_BANLIST; echo "Done."'
alias unban='         cur_banle;  list2unban $CUR_BANLIST;  echo "Done."'

alias iptables_rules_backup='   echo "Backup   iptables.rules ..."; sudo iptables-save > $IPTABLE_RULE'
alias iptables_rules_recover='  echo "Recover  iptables.rules ..."; sudo mv $IPTABLE_RULE /etc/iptables/'
alias iptables_rules_restart='  echo "restarting iptables     ..."; sudo systemctl restart iptables'
alias iptables_rules_update='   iptables_rules_backup; iptables_rules_recover; iptables_rules_restart;'

alias darkle='     darklist      > $DARKLIST        ; echo "saved    darklist       ...";'
alias blackle='    blacklist     > $BLACKLIST       ; echo "saved    blacklist      ...";'
alias whitele='    whitelist     > $WHITELIST       ; echo "saved    whitelist      ...";' 
alias banle='      banlist       > $BANLIST         ; echo "saved    banlist        ...";'
alias cur_banle='  cur_banlist   > $CUR_BANLIST     ; echo "saved    cur_banlist    ...";'
alias merge_banle='merge_banlist > $MERGE_BANLIST   ; echo "saved    merge_banlist  ...";'
alias diff_banle=' diff_banlist  > $DIFF_BANLIST    ; echo "saved    diff_banlist   ...";'

list2info              (){ for i in $(cat $1); do curl ipinfo.io/$i 2&>/dev/null ; done }
ipban_enlist2info      (){ list2info $1 > ${1}_INFO }
ipban_cur_banlist_info (){ ipban_enlist2info $CUR_BANLIST }
alias ipban_get_cur_banlist_info='cat $CUR_BANLIST_INFO '
alias banlistinfo='   list2info $BANLIST '
alias whitelistinfo=' list2info $WHITELIST '
list2info_analysed_by (){ list2info $2 | grep $1 | sort | uniq -c }

alias banloop='   while true; do ban; sleep 150; done   '

