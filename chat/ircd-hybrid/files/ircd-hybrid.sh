#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: ircd-hybrid.sh,v 1.1 2003/07/29 17:26:02 jmmv Exp $
#
# PROVIDE: ircdhybrid
# REQUIRE: DAEMON

name="ircdhybrid"
rcvar=$name
pidfile="@PPATH@"
command="@SPATH@"
conffile="@DPATH@/ircd.conf"
required_files="$conffile"
start_precmd=set_pid_file

set_pid_file () {
	@TOUCH@ $pidfile && @CHOWN@ @USER@ $pidfile && @CHMOD@ 600 $pidfile
}

if [ -d /etc/rc.d ]; then :; else
	command=${1:-start}

	case ${command} in
	start)
	if [ -x @SPATH@ -a -f  "$conffile" ]
	then
		echo "Starting ${name}."
		set_pid_file || exit 1
		exec @SPATH@
	fi
	;;
	stop)
	if [ -f ${pidfile} ]; then
		pid=`head -1 ${pidfile}`
		echo "Stopping ${name}."
		kill -TERM ${pid}
	else
		echo "${name} not running?"
	fi
	;;
	restart)
	( $0 stop )
	sleep 1
	$0 start
	;;
	status)
	if [ -f ${pidfile} ]; then
		pid=`head -1 ${pidfile}`
		echo "${name} is running as pid ${pid}."
	else
		echo "${name} is not running."
	fi
	;;
	esac
	exit 0
fi

. /etc/rc.subr

load_rc_config $name
run_rc_command "$1"
