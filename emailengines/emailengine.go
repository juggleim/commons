package emailengines

type IEmailEngine interface {
	SendMail(toAddress string, subject string, body string) error
}
