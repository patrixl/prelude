(setq prelude-flyspell nil)

(prelude-require-packages '(iedit multiple-cursors elpher flycheck-clj-kondo
                                  neotree jenkinsfile-mode))
(require 'iedit)
(require 'multiple-cursors)
(require 'flycheck-clj-kondo)

(setq browse-url-browser-function 'eww-browse-url)


(advice-add 'eww-browse-url :around 'elpher:eww-browse-url)

(defun elpher:eww-browse-url (original url &optional new-window)
  "Handle gemini links."
  (cond ((string-match-p "\\`\\(gemini\\|gopher\\)://" url)
	 (require 'elpher)
	 (elpher-go url))
	(t (funcall original url new-window))))


(remove-hook 'file-name-at-point-functions 'ffap-guess-file-name-at-point)
