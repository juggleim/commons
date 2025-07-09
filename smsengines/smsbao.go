package smsengines

import (
	"fmt"
	"net/url"
	"strings"

	"github.com/juggleim/commons/tools"
)

type SmsBaoEngine struct {
	Username string
	Password string
	Template string
}

func (eng *SmsBaoEngine) SmsSend(phone string, params map[string]interface{}) error {
	smscode, exist := params["code"]
	if !exist || phone == "" {
		return fmt.Errorf("sms failed. params is illegal")
	}
	content := strings.ReplaceAll(eng.Template, "{code}", smscode.(string))
	url := fmt.Sprintf("https://api.smsbao.com/sms?u=%s&p=%s&m=%s&c=%s", eng.Username, eng.Password, phone, url.QueryEscape(content))
	resp, code, err := tools.HttpDo("GET", url, map[string]string{}, "")
	if err != nil {
		return err
	}
	if code != 200 {
		return fmt.Errorf("sms failed. httpcode:%d\tresp:%s", code, resp)
	}
	return nil
}
