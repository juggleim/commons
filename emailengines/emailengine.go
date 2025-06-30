package emailengines

var (
	DefaultEmailEngine IEmailEngine = &NilEmailEngine{}
)

type IEmailEngine interface {
	SendMail(toAddress string, subject string, body string) error
}

type NilEmailEngine struct{}

func (engine *NilEmailEngine) SendMail(toAddress string, subject string, body string) error {
	return nil
}
